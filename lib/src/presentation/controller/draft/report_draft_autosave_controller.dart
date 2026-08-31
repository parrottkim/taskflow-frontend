part of '../controller.dart';

@riverpod
class ReportDraftAutosaveController extends _$ReportDraftAutosaveController {
  static const _delay = Duration(seconds: 10);

  Timer? _timer;
  Future<void> _saveQueue = Future<void>.value();

  @override
  DraftAutosaveState build({
    required int projectId,
    int? reportId,
    int? scheduleId,
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

    final formProvider = reportFormControllerProvider(
      projectId: projectId,
      reportId: reportId,
      scheduleId: scheduleId,
    );
    final payload = ref.read(formProvider.notifier).toDraftPayload();
    final files = ref.read(formProvider).requireValue.files;

    final operation = _saveQueue.then((_) => _save(payload, files));

    _saveQueue = operation.then((_) {}, onError: (_, _) {});

    return operation;
  }

  Future<void> _save(ReportDraftPayload payload, List<XFile> files) async {
    try {
      state = const DraftAutosaveState.saving();

      final draftProvider = reportDraftControllerProvider(projectId: projectId);

      await ref.read(draftProvider.future);
      if (!ref.mounted) return;

      await ref
          .read(draftProvider.notifier)
          .save(
            payload: payload,
            files: files,
            projectId: projectId,
            reportId: reportId,
            scheduleId: payload.schedule?.id,
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
