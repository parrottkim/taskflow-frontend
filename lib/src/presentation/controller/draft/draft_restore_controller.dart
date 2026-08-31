part of '../controller.dart';

@Riverpod(keepAlive: true)
class DraftRestoreController extends _$DraftRestoreController {
  @override
  DraftRestoreState build() => const DraftRestoreState.idle();

  Future<DraftRestore<DocumentDraftPayload>?> restoreDocument(
    String draftId,
  ) async {
    final draftProvider = documentDraftControllerProvider;
    final draft = ref
        .read(draftProvider)
        .value
        ?.drafts
        .firstWhereOrNull((item) => item.id == draftId);
    final restored = await _restore(
      draft: draft,
      type: DraftFormType.document,
      version: DraftPayloadVersion.document,
      parse: DocumentDraftPayload.fromJson,
    );

    if (restored != null && ref.mounted) {
      ref.read(draftProvider.notifier).select(draftId);
    }

    return restored;
  }

  Future<DraftRestore<IssueDraftPayload>?> restoreIssue({
    required String draftId,
    required int projectId,
  }) async {
    final draftProvider = issueDraftControllerProvider(projectId: projectId);
    final draft = ref
        .read(draftProvider)
        .value
        ?.drafts
        .firstWhereOrNull((item) => item.id == draftId);
    final restored = await _restore(
      draft: draft,
      type: DraftFormType.issue,
      version: DraftPayloadVersion.issue,
      parse: IssueDraftPayload.fromJson,
    );

    if (restored != null && ref.mounted) {
      ref.read(draftProvider.notifier).select(draftId);
    }

    return restored;
  }

  Future<DraftRestore<ReportDraftPayload>?> restoreReport({
    required String draftId,
    required int projectId,
  }) async {
    final draftProvider = reportDraftControllerProvider(projectId: projectId);
    final draft = ref
        .read(draftProvider)
        .value
        ?.drafts
        .firstWhereOrNull((item) => item.id == draftId);
    final restored = await _restore(
      draft: draft,
      type: DraftFormType.report,
      version: DraftPayloadVersion.report,
      parse: ReportDraftPayload.fromJson,
    );

    if (restored != null && ref.mounted) {
      ref.read(draftProvider.notifier).select(draftId);
    }

    return restored;
  }

  Future<DraftRestore<T>?> _restore<T>({
    required Draft? draft,
    required DraftFormType type,
    required int version,
    required T Function(Map<String, dynamic>) parse,
  }) async {
    state = const DraftRestoreState.restoring();

    if (draft == null || draft.type != type || draft.version != version) {
      state = const DraftRestoreState.invalid();
      return null;
    }

    late final List<DraftAsset> assets;
    try {
      assets = await ref
          .read(draftRepositoryProvider)
          .getAssetsByDraft(draftId: draft.id);
    } catch (error, stackTrace) {
      if (!ref.mounted) return null;

      state = const DraftRestoreState.failure();
      ref
          .read(errorControllerProvider.notifier)
          .handleException(error, stackTrace);
      return null;
    }

    if (!ref.mounted) return null;

    try {
      final rawContent = draft.payload['content'];
      if (rawContent != null && rawContent is! String) {
        state = const DraftRestoreState.invalid();
        return null;
      }

      final content =
          rawContent is String && rawContent.contains('draft-asset://')
          ? DraftContentCodec.restore(content: rawContent, assets: assets)
          : rawContent as String?;
      final payload = parse({...draft.payload, 'content': content});
      final files = assets
          .where((asset) => asset.type == DraftAssetType.attachment)
          .map(
            (asset) => XFile.fromData(
              asset.bytes,
              mimeType: asset.mime,
              name: asset.fileName ?? asset.id,
              lastModified: asset.updatedAt,
            ),
          )
          .toList();

      state = const DraftRestoreState.restored();
      return DraftRestore(payload: payload, files: files);
    } catch (error, stackTrace) {
      debugPrint('${type.name} draft payload is invalid: $error');
      debugPrintStack(stackTrace: stackTrace);
      state = const DraftRestoreState.invalid();
      return null;
    }
  }
}
