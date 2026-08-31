part of '../data.dart';

class DraftDataSource implements DraftRepository {
  static const _draftStore = 'drafts';
  static const _assetStore = 'draft_assets';

  final Database _database;

  DraftDataSource({required this._database});

  Map<String, dynamic> _normalizeRecord(Object value) =>
      Map<String, dynamic>.from(jsonDecode(jsonEncode(value)) as Map);

  @override
  Future<void> saveDraft({required Draft draft}) async {
    final transaction = _database.transaction(_draftStore, idbModeReadWrite);
    final record = _normalizeRecord(draft.toJson());

    await transaction.objectStore(_draftStore).put(record);

    await transaction.completed;
  }

  @override
  Future<Draft?> getDraft({required String id}) async {
    final transaction = _database.transaction(_draftStore, idbModeReadOnly);

    final record = await transaction.objectStore(_draftStore).getObject(id);

    await transaction.completed;

    if (record == null) return null;

    return Draft.fromJson(_normalizeRecord(record));
  }

  @override
  Future<List<Draft>> getDraftsByUser({required int userId}) async {
    final transaction = _database.transaction(_draftStore, idbModeReadOnly);

    final drafts = <Draft>[];
    final index = transaction.objectStore(_draftStore).index('by_user');

    await for (final cursor in index.openCursor(
      key: userId,
      autoAdvance: true,
    )) {
      drafts.add(Draft.fromJson(_normalizeRecord(cursor.value)));
    }

    await transaction.completed;

    drafts.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return drafts;
  }

  @override
  Future<void> deleteDraft({required String id}) async {
    final transaction = _database.transaction([
      _draftStore,
      _assetStore,
    ], idbModeReadWrite);

    await transaction.objectStore(_draftStore).delete(id);

    final assetIndex = transaction.objectStore(_assetStore).index('by_draft');
    await for (final cursor in assetIndex.openCursor(
      key: id,
      autoAdvance: true,
    )) {
      await cursor.delete();
    }

    await transaction.completed;
  }

  @override
  Future<void> saveAsset({required DraftAsset asset}) async {
    final transaction = _database.transaction(_assetStore, idbModeReadWrite);

    await transaction.objectStore(_assetStore).put(asset.toJson());

    await transaction.completed;
  }

  @override
  Future<DraftAsset?> getAsset({required String id}) async {
    final transaction = _database.transaction(_assetStore, idbModeReadOnly);

    final record = await transaction.objectStore(_assetStore).getObject(id);

    if (record == null) return null;

    return DraftAsset.fromJson(record as Map<String, dynamic>);
  }

  @override
  Future<List<DraftAsset>> getAssetsByDraft({required String draftId}) async {
    final transaction = _database.transaction(_assetStore, idbModeReadOnly);

    final assets = <DraftAsset>[];
    final index = transaction.objectStore(_assetStore).index('by_draft');

    await for (final cursor in index.openCursor(
      key: draftId,
      autoAdvance: true,
    )) {
      assets.add(
        DraftAsset.fromJson(Map<String, Object?>.from(cursor.value as Map)),
      );
    }

    await transaction.completed;

    assets.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return assets;
  }

  @override
  Future<void> replaceAssets({
    required String draftId,
    required List<DraftAsset> assets,
  }) async {
    final transaction = _database.transaction(_assetStore, idbModeReadWrite);
    final store = transaction.objectStore(_assetStore);
    final index = store.index('by_draft');

    await for (final cursor in index.openCursor(
      key: draftId,
      autoAdvance: true,
    )) {
      await cursor.delete();
    }

    for (final asset in assets) {
      await store.put(asset.toJson());
    }

    await transaction.completed;
  }

  @override
  Future<void> deleteAsset({required String id}) async {
    final transaction = _database.transaction(_assetStore, idbModeReadWrite);

    await transaction.objectStore(_assetStore).delete(id);

    await transaction.completed;
  }

  @override
  Future<void> deleteAll() async {
    final transaction = _database.transaction([
      _draftStore,
      _assetStore,
    ], idbModeReadWrite);

    await transaction.objectStore(_draftStore).clear();
    await transaction.objectStore(_assetStore).clear();
    await transaction.completed;
  }
}

@riverpod
DraftRepository draftRepository(Ref ref) {
  final database = ref.watch(indexedDatabaseProvider);
  return DraftDataSource(database: database);
}
