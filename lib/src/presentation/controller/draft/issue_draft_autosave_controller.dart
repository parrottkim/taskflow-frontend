part of '../controller.dart';

@riverpod
class IssueDraftAutosaveController extends _$IssueDraftAutosaveController {
  static const _delay = Duration(seconds: 10);

  Timer? _timer;
  Future<void> _saveQueue = Future<void>.value();

  @override
  DraftAutosaveState build({
    required int projectId,
    required int categoryId,
    int? issueId,
  }) {
    ref.onDispose(() => _timer?.cancel());
    return const DraftAutosaveState.idle();
  }

  void schedule() {
    _timer?.cancel();
    _timer = Timer(_delay, () => unawaited(flush()));
  }

  Future<void> flush() {
    final timer = _timer;
    if (timer == null) return _saveQueue;

    timer.cancel();
    _timer = null;

    final formProvider = issueFormControllerProvider(
      projectId: projectId,
      issueId: issueId,
      categoryId: categoryId,
    );

    final payload = ref.read(formProvider.notifier).toDraftPayload();
    final files = ref.read(formProvider).requireValue.files;

    final operation = _saveQueue.then((_) => _save(payload, files));

    _saveQueue = operation.then((_) {}, onError: (_, _) {});

    return operation;
  }

  Future<void> _save(IssueDraftPayload payload, List<XFile> files) async {
    try {
      state = const DraftAutosaveState.saving();

      final draftProvider = issueDraftControllerProvider(projectId: projectId);

      await ref.read(draftProvider.future);
      if (!ref.mounted) return;

      await ref
          .read(draftProvider.notifier)
          .save(
            payload: payload,
            files: files,
            projectId: projectId,
            issueId: issueId,
          );

      if (!ref.mounted) return;

      state = const DraftAutosaveState.saved();
    } catch (error, stackTrace) {
      if (!ref.mounted) return;

      state = const DraftAutosaveState.failed();
      ref
          .read(errorControllerProvider.notifier)
          .handleException(error, stackTrace);
    }
  }
}
