part of '../controller.dart';

@riverpod
class DocumentDraftController extends _$DocumentDraftController {
  @override
  FutureOr<DraftState> build() => _init();

  Future<DraftState> _init() async {
    final auth = ref.watch(authControllerProvider);

    if (auth is! AuthAuthenticated) return DraftState();

    final user = auth.user;

    final drafts = await ref
        .read(draftRepositoryProvider)
        .getDraftsByUser(userId: user.id);

    final filteredDrafts = drafts
        .where((draft) => draft.type == DraftFormType.document)
        .toList();

    return DraftState(drafts: filteredDrafts);
  }

  void clearSelection() {
    final value = state.value;
    if (value == null || value.currentDraftId == null) return;

    state = AsyncData(value.copyWith(currentDraftId: null));
  }

  void select(String draftId) {
    final value = state.value;
    if (value == null || !value.drafts.any((draft) => draft.id == draftId)) {
      return;
    }

    state = AsyncData(value.copyWith(currentDraftId: draftId));
  }

  Future<void> save({
    required DocumentDraftPayload payload,
    required List<XFile> files,
    int? documentId,
  }) async {
    final auth = ref.read(authControllerProvider);

    if (auth is! AuthAuthenticated) return;

    final value = state.requireValue;
    final now = DateTime.now();

    final mode = documentId == null ? DraftMode.create : DraftMode.edit;
    final currentDraft = value.currentDraftId == null
        ? null
        : value.drafts.firstWhereOrNull(
            (draft) =>
                draft.id == value.currentDraftId &&
                draft.mode == mode &&
                draft.entityId == documentId,
          );

    final draftId = currentDraft?.id ?? const Uuid().v4();
    final encoded = DraftContentCodec.encode(
      content: payload.content ?? '',
      draftId: draftId,
      now: now,
    );

    final attachments = <DraftAsset>[];

    for (final (index, file) in files.indexed) {
      final bytes = await file.readAsBytes();
      final mime =
          file.mimeType ??
          lookupMimeType(file.name, headerBytes: bytes) ??
          'application/octet-stream';

      attachments.add(
        DraftAsset(
          id: '${draftId}_attachment_$index',
          draftId: draftId,
          bytes: bytes,
          mime: mime,
          type: DraftAssetType.attachment,
          fileName: file.name,
          createdAt: now,
          updatedAt: now,
        ),
      );
    }

    final draftContext = {'folderId': payload.folderId};
    final draftPayload = payload.copyWith(content: encoded.content).toJson();
    final draft = switch (currentDraft) {
      final Draft current => current.copyWith(
        context: draftContext,
        payload: draftPayload,
        status: DraftSyncStatus.pending,
        updatedAt: now,
      ),
      null => Draft(
        id: draftId,
        userId: auth.user.id,
        type: DraftFormType.document,
        mode: mode,
        version: DraftPayloadVersion.document,
        context: draftContext,
        payload: draftPayload,
        entityId: documentId,
        createdAt: now,
        updatedAt: now,
      ),
    };

    final assets = [...encoded.assets, ...attachments];

    await ref.read(draftRepositoryProvider).saveDraft(draft: draft);
    await ref
        .read(draftRepositoryProvider)
        .replaceAssets(draftId: draft.id, assets: assets);

    state = AsyncData(
      value.copyWith(
        currentDraftId: draft.id,
        drafts: [draft, ...value.drafts.where((item) => item.id != draft.id)],
      ),
    );
  }

  Future<void> delete(String draftId) async {
    await ref.read(draftRepositoryProvider).deleteDraft(id: draftId);

    final value = state.requireValue;
    final drafts = value.drafts.where((draft) => draft.id != draftId).toList();

    state = AsyncData(
      value.copyWith(
        drafts: drafts,
        currentDraftId: value.currentDraftId == draftId
            ? null
            : value.currentDraftId,
      ),
    );
  }

  Future<void> deleteAllDrafts() async {
    final draftIds = state.requireValue.drafts
        .map((draft) => draft.id)
        .toList();

    for (final draftId in draftIds) {
      await delete(draftId);
    }
  }

  Future<void> deleteCurrent() async {
    final draftId = state.value?.currentDraftId;
    if (draftId == null) return;

    await delete(draftId);
  }
}
