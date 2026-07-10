// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AccountFilterController)
final accountFilterControllerProvider = AccountFilterControllerProvider._();

final class AccountFilterControllerProvider
    extends
        $AsyncNotifierProvider<AccountFilterController, AccountFilterState> {
  AccountFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accountFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accountFilterControllerHash();

  @$internal
  @override
  AccountFilterController create() => AccountFilterController();
}

String _$accountFilterControllerHash() =>
    r'bb14cf892948c1bdfaa10e442fc2a0ee451ebb74';

abstract class _$AccountFilterController
    extends $AsyncNotifier<AccountFilterState> {
  FutureOr<AccountFilterState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<AccountFilterState>, AccountFilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AccountFilterState>, AccountFilterState>,
              AsyncValue<AccountFilterState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(AddressController)
final addressControllerProvider = AddressControllerProvider._();

final class AddressControllerProvider
    extends $NotifierProvider<AddressController, AddressState> {
  AddressControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addressControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addressControllerHash();

  @$internal
  @override
  AddressController create() => AddressController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddressState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddressState>(value),
    );
  }
}

String _$addressControllerHash() => r'a729cbf798651cb5b9fe9541766590eb0cc5c2b5';

abstract class _$AddressController extends $Notifier<AddressState> {
  AddressState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AddressState, AddressState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AddressState, AddressState>,
              AddressState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(AuthController)
final authControllerProvider = AuthControllerProvider._();

final class AuthControllerProvider
    extends $NotifierProvider<AuthController, AuthState> {
  AuthControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authControllerHash();

  @$internal
  @override
  AuthController create() => AuthController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthState>(value),
    );
  }
}

String _$authControllerHash() => r'9868b959fd0fc015ddaae12d4b95bb8e0bf5d744';

abstract class _$AuthController extends $Notifier<AuthState> {
  AuthState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AuthState, AuthState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthState, AuthState>,
              AuthState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(CalendarController)
final calendarControllerProvider = CalendarControllerProvider._();

final class CalendarControllerProvider
    extends $AsyncNotifierProvider<CalendarController, CalendarState> {
  CalendarControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'calendarControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$calendarControllerHash();

  @$internal
  @override
  CalendarController create() => CalendarController();
}

String _$calendarControllerHash() =>
    r'a9c4619bfaf92f143a41a62eb1ee201cbca4b0eb';

abstract class _$CalendarController extends $AsyncNotifier<CalendarState> {
  FutureOr<CalendarState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<CalendarState>, CalendarState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CalendarState>, CalendarState>,
              AsyncValue<CalendarState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(DateSelectionController)
final dateSelectionControllerProvider = DateSelectionControllerProvider._();

final class DateSelectionControllerProvider
    extends $NotifierProvider<DateSelectionController, DateSelectionState> {
  DateSelectionControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dateSelectionControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dateSelectionControllerHash();

  @$internal
  @override
  DateSelectionController create() => DateSelectionController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateSelectionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateSelectionState>(value),
    );
  }
}

String _$dateSelectionControllerHash() =>
    r'5ad2c01e41c1512f50a695209446182953241701';

abstract class _$DateSelectionController extends $Notifier<DateSelectionState> {
  DateSelectionState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DateSelectionState, DateSelectionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DateSelectionState, DateSelectionState>,
              DateSelectionState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(LatestUpdateController)
final latestUpdateControllerProvider = LatestUpdateControllerProvider._();

final class LatestUpdateControllerProvider
    extends $AsyncNotifierProvider<LatestUpdateController, LatestUpdateState> {
  LatestUpdateControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'latestUpdateControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$latestUpdateControllerHash();

  @$internal
  @override
  LatestUpdateController create() => LatestUpdateController();
}

String _$latestUpdateControllerHash() =>
    r'6236a34a4a29b9538c5553fbffb176d1759acfb6';

abstract class _$LatestUpdateController
    extends $AsyncNotifier<LatestUpdateState> {
  FutureOr<LatestUpdateState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<LatestUpdateState>, LatestUpdateState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LatestUpdateState>, LatestUpdateState>,
              AsyncValue<LatestUpdateState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ProjectStatsController)
final projectStatsControllerProvider = ProjectStatsControllerFamily._();

final class ProjectStatsControllerProvider
    extends $AsyncNotifierProvider<ProjectStatsController, ProjectStatsState> {
  ProjectStatsControllerProvider._({
    required ProjectStatsControllerFamily super.from,
    required ({DateTime start, DateTime end}) super.argument,
  }) : super(
         retry: null,
         name: r'projectStatsControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectStatsControllerHash();

  @override
  String toString() {
    return r'projectStatsControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ProjectStatsController create() => ProjectStatsController();

  @override
  bool operator ==(Object other) {
    return other is ProjectStatsControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectStatsControllerHash() =>
    r'7715e5a2f4a05c044ea9a12dc05bf8095c487a66';

final class ProjectStatsControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ProjectStatsController,
          AsyncValue<ProjectStatsState>,
          ProjectStatsState,
          FutureOr<ProjectStatsState>,
          ({DateTime start, DateTime end})
        > {
  ProjectStatsControllerFamily._()
    : super(
        retry: null,
        name: r'projectStatsControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectStatsControllerProvider call({
    required DateTime start,
    required DateTime end,
  }) => ProjectStatsControllerProvider._(
    argument: (start: start, end: end),
    from: this,
  );

  @override
  String toString() => r'projectStatsControllerProvider';
}

abstract class _$ProjectStatsController
    extends $AsyncNotifier<ProjectStatsState> {
  late final _$args = ref.$arg as ({DateTime start, DateTime end});
  DateTime get start => _$args.start;
  DateTime get end => _$args.end;

  FutureOr<ProjectStatsState> build({
    required DateTime start,
    required DateTime end,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ProjectStatsState>, ProjectStatsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProjectStatsState>, ProjectStatsState>,
              AsyncValue<ProjectStatsState>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(start: _$args.start, end: _$args.end),
    );
  }
}

@ProviderFor(SummaryController)
final summaryControllerProvider = SummaryControllerFamily._();

final class SummaryControllerProvider
    extends $AsyncNotifierProvider<SummaryController, SummaryState> {
  SummaryControllerProvider._({
    required SummaryControllerFamily super.from,
    required ({DateTime start, DateTime end}) super.argument,
  }) : super(
         retry: null,
         name: r'summaryControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$summaryControllerHash();

  @override
  String toString() {
    return r'summaryControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  SummaryController create() => SummaryController();

  @override
  bool operator ==(Object other) {
    return other is SummaryControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$summaryControllerHash() => r'f6d803617aff920046553d02827bbb9286d9afc0';

final class SummaryControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          SummaryController,
          AsyncValue<SummaryState>,
          SummaryState,
          FutureOr<SummaryState>,
          ({DateTime start, DateTime end})
        > {
  SummaryControllerFamily._()
    : super(
        retry: null,
        name: r'summaryControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SummaryControllerProvider call({
    required DateTime start,
    required DateTime end,
  }) => SummaryControllerProvider._(
    argument: (start: start, end: end),
    from: this,
  );

  @override
  String toString() => r'summaryControllerProvider';
}

abstract class _$SummaryController extends $AsyncNotifier<SummaryState> {
  late final _$args = ref.$arg as ({DateTime start, DateTime end});
  DateTime get start => _$args.start;
  DateTime get end => _$args.end;

  FutureOr<SummaryState> build({
    required DateTime start,
    required DateTime end,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<SummaryState>, SummaryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SummaryState>, SummaryState>,
              AsyncValue<SummaryState>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(start: _$args.start, end: _$args.end),
    );
  }
}

@ProviderFor(WorldMapController)
final worldMapControllerProvider = WorldMapControllerProvider._();

final class WorldMapControllerProvider
    extends $AsyncNotifierProvider<WorldMapController, WorldMapState> {
  WorldMapControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'worldMapControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$worldMapControllerHash();

  @$internal
  @override
  WorldMapController create() => WorldMapController();
}

String _$worldMapControllerHash() =>
    r'a2691e0d9196b8e9e630e8cae7c58db723055e49';

abstract class _$WorldMapController extends $AsyncNotifier<WorldMapState> {
  FutureOr<WorldMapState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<WorldMapState>, WorldMapState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WorldMapState>, WorldMapState>,
              AsyncValue<WorldMapState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(DataFilterController)
final dataFilterControllerProvider = DataFilterControllerProvider._();

final class DataFilterControllerProvider
    extends $AsyncNotifierProvider<DataFilterController, DataFilterState> {
  DataFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dataFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dataFilterControllerHash();

  @$internal
  @override
  DataFilterController create() => DataFilterController();
}

String _$dataFilterControllerHash() =>
    r'29333056457e961e75c7521168f55a3d47e16e9c';

abstract class _$DataFilterController extends $AsyncNotifier<DataFilterState> {
  FutureOr<DataFilterState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<DataFilterState>, DataFilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DataFilterState>, DataFilterState>,
              AsyncValue<DataFilterState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(DocumentFilterController)
final documentFilterControllerProvider = DocumentFilterControllerProvider._();

final class DocumentFilterControllerProvider
    extends
        $AsyncNotifierProvider<DocumentFilterController, DocumentFilterState> {
  DocumentFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'documentFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$documentFilterControllerHash();

  @$internal
  @override
  DocumentFilterController create() => DocumentFilterController();
}

String _$documentFilterControllerHash() =>
    r'49c7eeb12aa5e5f05f86954a6762c3f324fe7a4e';

abstract class _$DocumentFilterController
    extends $AsyncNotifier<DocumentFilterState> {
  FutureOr<DocumentFilterState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<DocumentFilterState>, DocumentFilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DocumentFilterState>, DocumentFilterState>,
              AsyncValue<DocumentFilterState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(DocumentFormController)
final documentFormControllerProvider = DocumentFormControllerFamily._();

final class DocumentFormControllerProvider
    extends $AsyncNotifierProvider<DocumentFormController, DocumentFormState> {
  DocumentFormControllerProvider._({
    required DocumentFormControllerFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'documentFormControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$documentFormControllerHash();

  @override
  String toString() {
    return r'documentFormControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DocumentFormController create() => DocumentFormController();

  @override
  bool operator ==(Object other) {
    return other is DocumentFormControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$documentFormControllerHash() =>
    r'e4b39e7d48e49b4727d28190fe796e4a95350a34';

final class DocumentFormControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          DocumentFormController,
          AsyncValue<DocumentFormState>,
          DocumentFormState,
          FutureOr<DocumentFormState>,
          int?
        > {
  DocumentFormControllerFamily._()
    : super(
        retry: null,
        name: r'documentFormControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DocumentFormControllerProvider call({int? documentId}) =>
      DocumentFormControllerProvider._(argument: documentId, from: this);

  @override
  String toString() => r'documentFormControllerProvider';
}

abstract class _$DocumentFormController
    extends $AsyncNotifier<DocumentFormState> {
  late final _$args = ref.$arg as int?;
  int? get documentId => _$args;

  FutureOr<DocumentFormState> build({int? documentId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<DocumentFormState>, DocumentFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DocumentFormState>, DocumentFormState>,
              AsyncValue<DocumentFormState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(documentId: _$args));
  }
}

@ProviderFor(DocumentListController)
final documentListControllerProvider = DocumentListControllerProvider._();

final class DocumentListControllerProvider
    extends $AsyncNotifierProvider<DocumentListController, DocumentListState> {
  DocumentListControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'documentListControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$documentListControllerHash();

  @$internal
  @override
  DocumentListController create() => DocumentListController();
}

String _$documentListControllerHash() =>
    r'a658a40efa73a786c5978692ebd56764f2866332';

abstract class _$DocumentListController
    extends $AsyncNotifier<DocumentListState> {
  FutureOr<DocumentListState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<DocumentListState>, DocumentListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DocumentListState>, DocumentListState>,
              AsyncValue<DocumentListState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(DocumentOptionsController)
final documentOptionsControllerProvider = DocumentOptionsControllerProvider._();

final class DocumentOptionsControllerProvider
    extends
        $AsyncNotifierProvider<
          DocumentOptionsController,
          DocumentOptionsState
        > {
  DocumentOptionsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'documentOptionsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$documentOptionsControllerHash();

  @$internal
  @override
  DocumentOptionsController create() => DocumentOptionsController();
}

String _$documentOptionsControllerHash() =>
    r'dee6e45833c43a0dc10c2571eb0e97d1bcbd618b';

abstract class _$DocumentOptionsController
    extends $AsyncNotifier<DocumentOptionsState> {
  FutureOr<DocumentOptionsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<DocumentOptionsState>, DocumentOptionsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<DocumentOptionsState>,
                DocumentOptionsState
              >,
              AsyncValue<DocumentOptionsState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(DocumentSubmitController)
final documentSubmitControllerProvider = DocumentSubmitControllerProvider._();

final class DocumentSubmitControllerProvider
    extends $NotifierProvider<DocumentSubmitController, DocumentSubmitState> {
  DocumentSubmitControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'documentSubmitControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$documentSubmitControllerHash();

  @$internal
  @override
  DocumentSubmitController create() => DocumentSubmitController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DocumentSubmitState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DocumentSubmitState>(value),
    );
  }
}

String _$documentSubmitControllerHash() =>
    r'e52261a7b2f0a2c530ab0958f4f32c4d4090b448';

abstract class _$DocumentSubmitController
    extends $Notifier<DocumentSubmitState> {
  DocumentSubmitState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DocumentSubmitState, DocumentSubmitState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DocumentSubmitState, DocumentSubmitState>,
              DocumentSubmitState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(DownloadController)
final downloadControllerProvider = DownloadControllerFamily._();

final class DownloadControllerProvider
    extends $AsyncNotifierProvider<DownloadController, DownloadState> {
  DownloadControllerProvider._({
    required DownloadControllerFamily super.from,
    required ({String? path, String? filename}) super.argument,
  }) : super(
         retry: null,
         name: r'downloadControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$downloadControllerHash();

  @override
  String toString() {
    return r'downloadControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  DownloadController create() => DownloadController();

  @override
  bool operator ==(Object other) {
    return other is DownloadControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$downloadControllerHash() =>
    r'460766c74d69917f16ae9156b226c12585bb57e8';

final class DownloadControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          DownloadController,
          AsyncValue<DownloadState>,
          DownloadState,
          FutureOr<DownloadState>,
          ({String? path, String? filename})
        > {
  DownloadControllerFamily._()
    : super(
        retry: null,
        name: r'downloadControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DownloadControllerProvider call({String? path, String? filename}) =>
      DownloadControllerProvider._(
        argument: (path: path, filename: filename),
        from: this,
      );

  @override
  String toString() => r'downloadControllerProvider';
}

abstract class _$DownloadController extends $AsyncNotifier<DownloadState> {
  late final _$args = ref.$arg as ({String? path, String? filename});
  String? get path => _$args.path;
  String? get filename => _$args.filename;

  FutureOr<DownloadState> build({String? path, String? filename});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<DownloadState>, DownloadState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DownloadState>, DownloadState>,
              AsyncValue<DownloadState>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(path: _$args.path, filename: _$args.filename),
    );
  }
}

@ProviderFor(ErrorController)
final errorControllerProvider = ErrorControllerProvider._();

final class ErrorControllerProvider
    extends $NotifierProvider<ErrorController, ErrorState> {
  ErrorControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'errorControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$errorControllerHash();

  @$internal
  @override
  ErrorController create() => ErrorController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ErrorState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ErrorState>(value),
    );
  }
}

String _$errorControllerHash() => r'f7b55b3c3d83258f6b2c8e2f7254a821e1da09c7';

abstract class _$ErrorController extends $Notifier<ErrorState> {
  ErrorState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ErrorState, ErrorState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ErrorState, ErrorState>,
              ErrorState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(IssueExportController)
final issueExportControllerProvider = IssueExportControllerProvider._();

final class IssueExportControllerProvider
    extends $NotifierProvider<IssueExportController, IssueExportState> {
  IssueExportControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'issueExportControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$issueExportControllerHash();

  @$internal
  @override
  IssueExportController create() => IssueExportController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IssueExportState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IssueExportState>(value),
    );
  }
}

String _$issueExportControllerHash() =>
    r'd40bda143132d4a9b8e39e73628fddc68af91679';

abstract class _$IssueExportController extends $Notifier<IssueExportState> {
  IssueExportState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<IssueExportState, IssueExportState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<IssueExportState, IssueExportState>,
              IssueExportState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(IssueFormController)
final issueFormControllerProvider = IssueFormControllerFamily._();

final class IssueFormControllerProvider
    extends $AsyncNotifierProvider<IssueFormController, IssueFormState> {
  IssueFormControllerProvider._({
    required IssueFormControllerFamily super.from,
    required ({int projectId, int categoryId, int? issueId}) super.argument,
  }) : super(
         retry: null,
         name: r'issueFormControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$issueFormControllerHash();

  @override
  String toString() {
    return r'issueFormControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  IssueFormController create() => IssueFormController();

  @override
  bool operator ==(Object other) {
    return other is IssueFormControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$issueFormControllerHash() =>
    r'2ddbec6417ebb7469635538754b630e2b89524b4';

final class IssueFormControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          IssueFormController,
          AsyncValue<IssueFormState>,
          IssueFormState,
          FutureOr<IssueFormState>,
          ({int projectId, int categoryId, int? issueId})
        > {
  IssueFormControllerFamily._()
    : super(
        retry: null,
        name: r'issueFormControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IssueFormControllerProvider call({
    required int projectId,
    required int categoryId,
    int? issueId,
  }) => IssueFormControllerProvider._(
    argument: (projectId: projectId, categoryId: categoryId, issueId: issueId),
    from: this,
  );

  @override
  String toString() => r'issueFormControllerProvider';
}

abstract class _$IssueFormController extends $AsyncNotifier<IssueFormState> {
  late final _$args =
      ref.$arg as ({int projectId, int categoryId, int? issueId});
  int get projectId => _$args.projectId;
  int get categoryId => _$args.categoryId;
  int? get issueId => _$args.issueId;

  FutureOr<IssueFormState> build({
    required int projectId,
    required int categoryId,
    int? issueId,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<IssueFormState>, IssueFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<IssueFormState>, IssueFormState>,
              AsyncValue<IssueFormState>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(
        projectId: _$args.projectId,
        categoryId: _$args.categoryId,
        issueId: _$args.issueId,
      ),
    );
  }
}

@ProviderFor(IssueListController)
final issueListControllerProvider = IssueListControllerFamily._();

final class IssueListControllerProvider
    extends $AsyncNotifierProvider<IssueListController, IssueListState> {
  IssueListControllerProvider._({
    required IssueListControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'issueListControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$issueListControllerHash();

  @override
  String toString() {
    return r'issueListControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  IssueListController create() => IssueListController();

  @override
  bool operator ==(Object other) {
    return other is IssueListControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$issueListControllerHash() =>
    r'07d1423cd87a3170992b1ab4e2bcfd2c23bc9cbe';

final class IssueListControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          IssueListController,
          AsyncValue<IssueListState>,
          IssueListState,
          FutureOr<IssueListState>,
          int
        > {
  IssueListControllerFamily._()
    : super(
        retry: null,
        name: r'issueListControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IssueListControllerProvider call({required int projectId}) =>
      IssueListControllerProvider._(argument: projectId, from: this);

  @override
  String toString() => r'issueListControllerProvider';
}

abstract class _$IssueListController extends $AsyncNotifier<IssueListState> {
  late final _$args = ref.$arg as int;
  int get projectId => _$args;

  FutureOr<IssueListState> build({required int projectId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<IssueListState>, IssueListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<IssueListState>, IssueListState>,
              AsyncValue<IssueListState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(projectId: _$args));
  }
}

@ProviderFor(IssueOptionsController)
final issueOptionsControllerProvider = IssueOptionsControllerProvider._();

final class IssueOptionsControllerProvider
    extends $AsyncNotifierProvider<IssueOptionsController, IssueOptionsState> {
  IssueOptionsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'issueOptionsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$issueOptionsControllerHash();

  @$internal
  @override
  IssueOptionsController create() => IssueOptionsController();
}

String _$issueOptionsControllerHash() =>
    r'60235a578137649553fd74a953e540d75547ac95';

abstract class _$IssueOptionsController
    extends $AsyncNotifier<IssueOptionsState> {
  FutureOr<IssueOptionsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<IssueOptionsState>, IssueOptionsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<IssueOptionsState>, IssueOptionsState>,
              AsyncValue<IssueOptionsState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(IssueSubmitController)
final issueSubmitControllerProvider = IssueSubmitControllerProvider._();

final class IssueSubmitControllerProvider
    extends $NotifierProvider<IssueSubmitController, IssueSubmitState> {
  IssueSubmitControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'issueSubmitControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$issueSubmitControllerHash();

  @$internal
  @override
  IssueSubmitController create() => IssueSubmitController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IssueSubmitState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IssueSubmitState>(value),
    );
  }
}

String _$issueSubmitControllerHash() =>
    r'687db6dc8d067f711051ff1c8c8957c28ac24b3d';

abstract class _$IssueSubmitController extends $Notifier<IssueSubmitState> {
  IssueSubmitState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<IssueSubmitState, IssueSubmitState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<IssueSubmitState, IssueSubmitState>,
              IssueSubmitState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ProcurementIssueFormController)
final procurementIssueFormControllerProvider =
    ProcurementIssueFormControllerFamily._();

final class ProcurementIssueFormControllerProvider
    extends
        $AsyncNotifierProvider<
          ProcurementIssueFormController,
          ProcurementIssueFormState
        > {
  ProcurementIssueFormControllerProvider._({
    required ProcurementIssueFormControllerFamily super.from,
    required ({int issueId, int? requestId}) super.argument,
  }) : super(
         retry: null,
         name: r'procurementIssueFormControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$procurementIssueFormControllerHash();

  @override
  String toString() {
    return r'procurementIssueFormControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ProcurementIssueFormController create() => ProcurementIssueFormController();

  @override
  bool operator ==(Object other) {
    return other is ProcurementIssueFormControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$procurementIssueFormControllerHash() =>
    r'455ef470a9957a86d6d3039e527cf94b2935f2be';

final class ProcurementIssueFormControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ProcurementIssueFormController,
          AsyncValue<ProcurementIssueFormState>,
          ProcurementIssueFormState,
          FutureOr<ProcurementIssueFormState>,
          ({int issueId, int? requestId})
        > {
  ProcurementIssueFormControllerFamily._()
    : super(
        retry: null,
        name: r'procurementIssueFormControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProcurementIssueFormControllerProvider call({
    required int issueId,
    int? requestId,
  }) => ProcurementIssueFormControllerProvider._(
    argument: (issueId: issueId, requestId: requestId),
    from: this,
  );

  @override
  String toString() => r'procurementIssueFormControllerProvider';
}

abstract class _$ProcurementIssueFormController
    extends $AsyncNotifier<ProcurementIssueFormState> {
  late final _$args = ref.$arg as ({int issueId, int? requestId});
  int get issueId => _$args.issueId;
  int? get requestId => _$args.requestId;

  FutureOr<ProcurementIssueFormState> build({
    required int issueId,
    int? requestId,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<ProcurementIssueFormState>,
              ProcurementIssueFormState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ProcurementIssueFormState>,
                ProcurementIssueFormState
              >,
              AsyncValue<ProcurementIssueFormState>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(issueId: _$args.issueId, requestId: _$args.requestId),
    );
  }
}

@ProviderFor(LocalController)
final localControllerProvider = LocalControllerProvider._();

final class LocalControllerProvider
    extends $AsyncNotifierProvider<LocalController, LocalState> {
  LocalControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localControllerHash();

  @$internal
  @override
  LocalController create() => LocalController();
}

String _$localControllerHash() => r'77e32e702d20a3487ee72db3f0a0959a0f08d29e';

abstract class _$LocalController extends $AsyncNotifier<LocalState> {
  FutureOr<LocalState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<LocalState>, LocalState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LocalState>, LocalState>,
              AsyncValue<LocalState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(NavigationFilterController)
final navigationFilterControllerProvider =
    NavigationFilterControllerProvider._();

final class NavigationFilterControllerProvider
    extends
        $AsyncNotifierProvider<
          NavigationFilterController,
          NavigationFilterState
        > {
  NavigationFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'navigationFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$navigationFilterControllerHash();

  @$internal
  @override
  NavigationFilterController create() => NavigationFilterController();
}

String _$navigationFilterControllerHash() =>
    r'c96817792f91e2232e26c2aae5b7aed64bb3a83d';

abstract class _$NavigationFilterController
    extends $AsyncNotifier<NavigationFilterState> {
  FutureOr<NavigationFilterState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<NavigationFilterState>, NavigationFilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<NavigationFilterState>,
                NavigationFilterState
              >,
              AsyncValue<NavigationFilterState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(NavigationSearchController)
final navigationSearchControllerProvider =
    NavigationSearchControllerProvider._();

final class NavigationSearchControllerProvider
    extends
        $AsyncNotifierProvider<
          NavigationSearchController,
          NavigationSearchState
        > {
  NavigationSearchControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'navigationSearchControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$navigationSearchControllerHash();

  @$internal
  @override
  NavigationSearchController create() => NavigationSearchController();
}

String _$navigationSearchControllerHash() =>
    r'ba3c29104e79fbaa5e7883cc2f6acf145f916dc2';

abstract class _$NavigationSearchController
    extends $AsyncNotifier<NavigationSearchState> {
  FutureOr<NavigationSearchState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<NavigationSearchState>, NavigationSearchState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<NavigationSearchState>,
                NavigationSearchState
              >,
              AsyncValue<NavigationSearchState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(OrganizationController)
final organizationControllerProvider = OrganizationControllerProvider._();

final class OrganizationControllerProvider
    extends $AsyncNotifierProvider<OrganizationController, OrganizationState> {
  OrganizationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'organizationControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$organizationControllerHash();

  @$internal
  @override
  OrganizationController create() => OrganizationController();
}

String _$organizationControllerHash() =>
    r'f142599df19c70d4f7d499d10badb9f756543295';

abstract class _$OrganizationController
    extends $AsyncNotifier<OrganizationState> {
  FutureOr<OrganizationState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<OrganizationState>, OrganizationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<OrganizationState>, OrganizationState>,
              AsyncValue<OrganizationState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ProjectDetailController)
final projectDetailControllerProvider = ProjectDetailControllerFamily._();

final class ProjectDetailControllerProvider
    extends
        $AsyncNotifierProvider<ProjectDetailController, ProjectDetailState> {
  ProjectDetailControllerProvider._({
    required ProjectDetailControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'projectDetailControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectDetailControllerHash();

  @override
  String toString() {
    return r'projectDetailControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProjectDetailController create() => ProjectDetailController();

  @override
  bool operator ==(Object other) {
    return other is ProjectDetailControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectDetailControllerHash() =>
    r'bec4e90a821dfb2c2c277740154589c1b84b6e9b';

final class ProjectDetailControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ProjectDetailController,
          AsyncValue<ProjectDetailState>,
          ProjectDetailState,
          FutureOr<ProjectDetailState>,
          int
        > {
  ProjectDetailControllerFamily._()
    : super(
        retry: null,
        name: r'projectDetailControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectDetailControllerProvider call({required int projectId}) =>
      ProjectDetailControllerProvider._(argument: projectId, from: this);

  @override
  String toString() => r'projectDetailControllerProvider';
}

abstract class _$ProjectDetailController
    extends $AsyncNotifier<ProjectDetailState> {
  late final _$args = ref.$arg as int;
  int get projectId => _$args;

  FutureOr<ProjectDetailState> build({required int projectId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ProjectDetailState>, ProjectDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProjectDetailState>, ProjectDetailState>,
              AsyncValue<ProjectDetailState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(projectId: _$args));
  }
}

@ProviderFor(ProjectDetailFilterController)
final projectDetailFilterControllerProvider =
    ProjectDetailFilterControllerProvider._();

final class ProjectDetailFilterControllerProvider
    extends
        $AsyncNotifierProvider<
          ProjectDetailFilterController,
          ProjectDetailFilterState
        > {
  ProjectDetailFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectDetailFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectDetailFilterControllerHash();

  @$internal
  @override
  ProjectDetailFilterController create() => ProjectDetailFilterController();
}

String _$projectDetailFilterControllerHash() =>
    r'7470c1c38f8d3c21824643500a7fae0047c4e9fa';

abstract class _$ProjectDetailFilterController
    extends $AsyncNotifier<ProjectDetailFilterState> {
  FutureOr<ProjectDetailFilterState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<ProjectDetailFilterState>,
              ProjectDetailFilterState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ProjectDetailFilterState>,
                ProjectDetailFilterState
              >,
              AsyncValue<ProjectDetailFilterState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ProjectFilterController)
final projectFilterControllerProvider = ProjectFilterControllerFamily._();

final class ProjectFilterControllerProvider
    extends
        $AsyncNotifierProvider<ProjectFilterController, ProjectFilterState> {
  ProjectFilterControllerProvider._({
    required ProjectFilterControllerFamily super.from,
    required ProjectFilterScope super.argument,
  }) : super(
         retry: null,
         name: r'projectFilterControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectFilterControllerHash();

  @override
  String toString() {
    return r'projectFilterControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProjectFilterController create() => ProjectFilterController();

  @override
  bool operator ==(Object other) {
    return other is ProjectFilterControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectFilterControllerHash() =>
    r'a51e15da246c79dae97c02b2640930cda70b5bc6';

final class ProjectFilterControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ProjectFilterController,
          AsyncValue<ProjectFilterState>,
          ProjectFilterState,
          FutureOr<ProjectFilterState>,
          ProjectFilterScope
        > {
  ProjectFilterControllerFamily._()
    : super(
        retry: null,
        name: r'projectFilterControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectFilterControllerProvider call(ProjectFilterScope scope) =>
      ProjectFilterControllerProvider._(argument: scope, from: this);

  @override
  String toString() => r'projectFilterControllerProvider';
}

abstract class _$ProjectFilterController
    extends $AsyncNotifier<ProjectFilterState> {
  late final _$args = ref.$arg as ProjectFilterScope;
  ProjectFilterScope get scope => _$args;

  FutureOr<ProjectFilterState> build(ProjectFilterScope scope);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ProjectFilterState>, ProjectFilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProjectFilterState>, ProjectFilterState>,
              AsyncValue<ProjectFilterState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(ProjectFormController)
final projectFormControllerProvider = ProjectFormControllerFamily._();

final class ProjectFormControllerProvider
    extends $AsyncNotifierProvider<ProjectFormController, ProjectFormState> {
  ProjectFormControllerProvider._({
    required ProjectFormControllerFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'projectFormControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectFormControllerHash();

  @override
  String toString() {
    return r'projectFormControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProjectFormController create() => ProjectFormController();

  @override
  bool operator ==(Object other) {
    return other is ProjectFormControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectFormControllerHash() =>
    r'47a9f7c0f6ecd43b5a46a348039e0ac0bf269155';

final class ProjectFormControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ProjectFormController,
          AsyncValue<ProjectFormState>,
          ProjectFormState,
          FutureOr<ProjectFormState>,
          int?
        > {
  ProjectFormControllerFamily._()
    : super(
        retry: null,
        name: r'projectFormControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectFormControllerProvider call({int? projectId}) =>
      ProjectFormControllerProvider._(argument: projectId, from: this);

  @override
  String toString() => r'projectFormControllerProvider';
}

abstract class _$ProjectFormController
    extends $AsyncNotifier<ProjectFormState> {
  late final _$args = ref.$arg as int?;
  int? get projectId => _$args;

  FutureOr<ProjectFormState> build({int? projectId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ProjectFormState>, ProjectFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProjectFormState>, ProjectFormState>,
              AsyncValue<ProjectFormState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(projectId: _$args));
  }
}

@ProviderFor(ProjectListController)
final projectListControllerProvider = ProjectListControllerFamily._();

final class ProjectListControllerProvider
    extends $AsyncNotifierProvider<ProjectListController, ProjectListState> {
  ProjectListControllerProvider._({
    required ProjectListControllerFamily super.from,
    required ProjectFilterScope super.argument,
  }) : super(
         retry: null,
         name: r'projectListControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectListControllerHash();

  @override
  String toString() {
    return r'projectListControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProjectListController create() => ProjectListController();

  @override
  bool operator ==(Object other) {
    return other is ProjectListControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectListControllerHash() =>
    r'96f791d1873abfbd5692f4b7d9cc43dd33bc7d9e';

final class ProjectListControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ProjectListController,
          AsyncValue<ProjectListState>,
          ProjectListState,
          FutureOr<ProjectListState>,
          ProjectFilterScope
        > {
  ProjectListControllerFamily._()
    : super(
        retry: null,
        name: r'projectListControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectListControllerProvider call(ProjectFilterScope scope) =>
      ProjectListControllerProvider._(argument: scope, from: this);

  @override
  String toString() => r'projectListControllerProvider';
}

abstract class _$ProjectListController
    extends $AsyncNotifier<ProjectListState> {
  late final _$args = ref.$arg as ProjectFilterScope;
  ProjectFilterScope get scope => _$args;

  FutureOr<ProjectListState> build(ProjectFilterScope scope);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ProjectListState>, ProjectListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProjectListState>, ProjectListState>,
              AsyncValue<ProjectListState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(ProjectOptionsController)
final projectOptionsControllerProvider = ProjectOptionsControllerProvider._();

final class ProjectOptionsControllerProvider
    extends
        $AsyncNotifierProvider<ProjectOptionsController, ProjectOptionsState> {
  ProjectOptionsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectOptionsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectOptionsControllerHash();

  @$internal
  @override
  ProjectOptionsController create() => ProjectOptionsController();
}

String _$projectOptionsControllerHash() =>
    r'c3b331d9a0fb93319647ac332a8add659936d8d9';

abstract class _$ProjectOptionsController
    extends $AsyncNotifier<ProjectOptionsState> {
  FutureOr<ProjectOptionsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ProjectOptionsState>, ProjectOptionsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProjectOptionsState>, ProjectOptionsState>,
              AsyncValue<ProjectOptionsState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ProjectSubmitController)
final projectSubmitControllerProvider = ProjectSubmitControllerProvider._();

final class ProjectSubmitControllerProvider
    extends $NotifierProvider<ProjectSubmitController, ProjectSubmitState> {
  ProjectSubmitControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectSubmitControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectSubmitControllerHash();

  @$internal
  @override
  ProjectSubmitController create() => ProjectSubmitController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectSubmitState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectSubmitState>(value),
    );
  }
}

String _$projectSubmitControllerHash() =>
    r'0be8ad81f1f59bea90160cb01b2781cdd8fa07f7';

abstract class _$ProjectSubmitController extends $Notifier<ProjectSubmitState> {
  ProjectSubmitState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ProjectSubmitState, ProjectSubmitState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProjectSubmitState, ProjectSubmitState>,
              ProjectSubmitState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ScheduleFilterController)
final scheduleFilterControllerProvider = ScheduleFilterControllerFamily._();

final class ScheduleFilterControllerProvider
    extends
        $AsyncNotifierProvider<ScheduleFilterController, ScheduleFilterState> {
  ScheduleFilterControllerProvider._({
    required ScheduleFilterControllerFamily super.from,
    required ScheduleFilterScope super.argument,
  }) : super(
         retry: null,
         name: r'scheduleFilterControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$scheduleFilterControllerHash();

  @override
  String toString() {
    return r'scheduleFilterControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ScheduleFilterController create() => ScheduleFilterController();

  @override
  bool operator ==(Object other) {
    return other is ScheduleFilterControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$scheduleFilterControllerHash() =>
    r'77a421f8bbcc5f36faa3a76fe24a4ceac98008ff';

final class ScheduleFilterControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ScheduleFilterController,
          AsyncValue<ScheduleFilterState>,
          ScheduleFilterState,
          FutureOr<ScheduleFilterState>,
          ScheduleFilterScope
        > {
  ScheduleFilterControllerFamily._()
    : super(
        retry: null,
        name: r'scheduleFilterControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ScheduleFilterControllerProvider call(ScheduleFilterScope scope) =>
      ScheduleFilterControllerProvider._(argument: scope, from: this);

  @override
  String toString() => r'scheduleFilterControllerProvider';
}

abstract class _$ScheduleFilterController
    extends $AsyncNotifier<ScheduleFilterState> {
  late final _$args = ref.$arg as ScheduleFilterScope;
  ScheduleFilterScope get scope => _$args;

  FutureOr<ScheduleFilterState> build(ScheduleFilterScope scope);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ScheduleFilterState>, ScheduleFilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ScheduleFilterState>, ScheduleFilterState>,
              AsyncValue<ScheduleFilterState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(ScheduleFormController)
final scheduleFormControllerProvider = ScheduleFormControllerFamily._();

final class ScheduleFormControllerProvider
    extends $AsyncNotifierProvider<ScheduleFormController, ScheduleFormState> {
  ScheduleFormControllerProvider._({
    required ScheduleFormControllerFamily super.from,
    required ({int categoryId, int? scheduleId}) super.argument,
  }) : super(
         retry: null,
         name: r'scheduleFormControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$scheduleFormControllerHash();

  @override
  String toString() {
    return r'scheduleFormControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ScheduleFormController create() => ScheduleFormController();

  @override
  bool operator ==(Object other) {
    return other is ScheduleFormControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$scheduleFormControllerHash() =>
    r'fb943571166d23ca0eab50db74c51613c3937f50';

final class ScheduleFormControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ScheduleFormController,
          AsyncValue<ScheduleFormState>,
          ScheduleFormState,
          FutureOr<ScheduleFormState>,
          ({int categoryId, int? scheduleId})
        > {
  ScheduleFormControllerFamily._()
    : super(
        retry: null,
        name: r'scheduleFormControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ScheduleFormControllerProvider call({
    required int categoryId,
    int? scheduleId,
  }) => ScheduleFormControllerProvider._(
    argument: (categoryId: categoryId, scheduleId: scheduleId),
    from: this,
  );

  @override
  String toString() => r'scheduleFormControllerProvider';
}

abstract class _$ScheduleFormController
    extends $AsyncNotifier<ScheduleFormState> {
  late final _$args = ref.$arg as ({int categoryId, int? scheduleId});
  int get categoryId => _$args.categoryId;
  int? get scheduleId => _$args.scheduleId;

  FutureOr<ScheduleFormState> build({required int categoryId, int? scheduleId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ScheduleFormState>, ScheduleFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ScheduleFormState>, ScheduleFormState>,
              AsyncValue<ScheduleFormState>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(categoryId: _$args.categoryId, scheduleId: _$args.scheduleId),
    );
  }
}

@ProviderFor(ScheduleListController)
final scheduleListControllerProvider = ScheduleListControllerFamily._();

final class ScheduleListControllerProvider
    extends $AsyncNotifierProvider<ScheduleListController, ScheduleListState> {
  ScheduleListControllerProvider._({
    required ScheduleListControllerFamily super.from,
    required ({ScheduleFilterScope scope, int? projectId, int? userId})
    super.argument,
  }) : super(
         retry: null,
         name: r'scheduleListControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$scheduleListControllerHash();

  @override
  String toString() {
    return r'scheduleListControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ScheduleListController create() => ScheduleListController();

  @override
  bool operator ==(Object other) {
    return other is ScheduleListControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$scheduleListControllerHash() =>
    r'c005aa530aa99394c0a4f72b5c70c7089811b8e7';

final class ScheduleListControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ScheduleListController,
          AsyncValue<ScheduleListState>,
          ScheduleListState,
          FutureOr<ScheduleListState>,
          ({ScheduleFilterScope scope, int? projectId, int? userId})
        > {
  ScheduleListControllerFamily._()
    : super(
        retry: null,
        name: r'scheduleListControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ScheduleListControllerProvider call({
    ScheduleFilterScope scope = ScheduleFilterScope.schedulePage,
    int? projectId,
    int? userId,
  }) => ScheduleListControllerProvider._(
    argument: (scope: scope, projectId: projectId, userId: userId),
    from: this,
  );

  @override
  String toString() => r'scheduleListControllerProvider';
}

abstract class _$ScheduleListController
    extends $AsyncNotifier<ScheduleListState> {
  late final _$args =
      ref.$arg as ({ScheduleFilterScope scope, int? projectId, int? userId});
  ScheduleFilterScope get scope => _$args.scope;
  int? get projectId => _$args.projectId;
  int? get userId => _$args.userId;

  FutureOr<ScheduleListState> build({
    ScheduleFilterScope scope = ScheduleFilterScope.schedulePage,
    int? projectId,
    int? userId,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ScheduleListState>, ScheduleListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ScheduleListState>, ScheduleListState>,
              AsyncValue<ScheduleListState>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(
        scope: _$args.scope,
        projectId: _$args.projectId,
        userId: _$args.userId,
      ),
    );
  }
}

@ProviderFor(ScheduleOptionsController)
final scheduleOptionsControllerProvider = ScheduleOptionsControllerProvider._();

final class ScheduleOptionsControllerProvider
    extends
        $AsyncNotifierProvider<
          ScheduleOptionsController,
          ScheduleOptionsState
        > {
  ScheduleOptionsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scheduleOptionsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scheduleOptionsControllerHash();

  @$internal
  @override
  ScheduleOptionsController create() => ScheduleOptionsController();
}

String _$scheduleOptionsControllerHash() =>
    r'1cebe4137bb97751b62197bee44282b0a7da7585';

abstract class _$ScheduleOptionsController
    extends $AsyncNotifier<ScheduleOptionsState> {
  FutureOr<ScheduleOptionsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<ScheduleOptionsState>, ScheduleOptionsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ScheduleOptionsState>,
                ScheduleOptionsState
              >,
              AsyncValue<ScheduleOptionsState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ScheduleSubmitController)
final scheduleSubmitControllerProvider = ScheduleSubmitControllerProvider._();

final class ScheduleSubmitControllerProvider
    extends $NotifierProvider<ScheduleSubmitController, ScheduleSubmitState> {
  ScheduleSubmitControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scheduleSubmitControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scheduleSubmitControllerHash();

  @$internal
  @override
  ScheduleSubmitController create() => ScheduleSubmitController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScheduleSubmitState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScheduleSubmitState>(value),
    );
  }
}

String _$scheduleSubmitControllerHash() =>
    r'cf61c236aadf524e5d45e482f85dee17cd8fee52';

abstract class _$ScheduleSubmitController
    extends $Notifier<ScheduleSubmitState> {
  ScheduleSubmitState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ScheduleSubmitState, ScheduleSubmitState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ScheduleSubmitState, ScheduleSubmitState>,
              ScheduleSubmitState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SupplierFilterController)
final supplierFilterControllerProvider = SupplierFilterControllerFamily._();

final class SupplierFilterControllerProvider
    extends
        $AsyncNotifierProvider<SupplierFilterController, SupplierFilterState> {
  SupplierFilterControllerProvider._({
    required SupplierFilterControllerFamily super.from,
    required SupplierFilterScope super.argument,
  }) : super(
         retry: null,
         name: r'supplierFilterControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$supplierFilterControllerHash();

  @override
  String toString() {
    return r'supplierFilterControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SupplierFilterController create() => SupplierFilterController();

  @override
  bool operator ==(Object other) {
    return other is SupplierFilterControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$supplierFilterControllerHash() =>
    r'c46db23b2c577188d650152ef1c5c1aacf893311';

final class SupplierFilterControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          SupplierFilterController,
          AsyncValue<SupplierFilterState>,
          SupplierFilterState,
          FutureOr<SupplierFilterState>,
          SupplierFilterScope
        > {
  SupplierFilterControllerFamily._()
    : super(
        retry: null,
        name: r'supplierFilterControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SupplierFilterControllerProvider call(SupplierFilterScope scope) =>
      SupplierFilterControllerProvider._(argument: scope, from: this);

  @override
  String toString() => r'supplierFilterControllerProvider';
}

abstract class _$SupplierFilterController
    extends $AsyncNotifier<SupplierFilterState> {
  late final _$args = ref.$arg as SupplierFilterScope;
  SupplierFilterScope get scope => _$args;

  FutureOr<SupplierFilterState> build(SupplierFilterScope scope);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<SupplierFilterState>, SupplierFilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SupplierFilterState>, SupplierFilterState>,
              AsyncValue<SupplierFilterState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(SupplierFormController)
final supplierFormControllerProvider = SupplierFormControllerFamily._();

final class SupplierFormControllerProvider
    extends $AsyncNotifierProvider<SupplierFormController, SupplierFormState> {
  SupplierFormControllerProvider._({
    required SupplierFormControllerFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'supplierFormControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$supplierFormControllerHash();

  @override
  String toString() {
    return r'supplierFormControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SupplierFormController create() => SupplierFormController();

  @override
  bool operator ==(Object other) {
    return other is SupplierFormControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$supplierFormControllerHash() =>
    r'2c2b763768ef0e2da11dc39510bb642918a7de6d';

final class SupplierFormControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          SupplierFormController,
          AsyncValue<SupplierFormState>,
          SupplierFormState,
          FutureOr<SupplierFormState>,
          int?
        > {
  SupplierFormControllerFamily._()
    : super(
        retry: null,
        name: r'supplierFormControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SupplierFormControllerProvider call({int? supplierId}) =>
      SupplierFormControllerProvider._(argument: supplierId, from: this);

  @override
  String toString() => r'supplierFormControllerProvider';
}

abstract class _$SupplierFormController
    extends $AsyncNotifier<SupplierFormState> {
  late final _$args = ref.$arg as int?;
  int? get supplierId => _$args;

  FutureOr<SupplierFormState> build({int? supplierId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<SupplierFormState>, SupplierFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SupplierFormState>, SupplierFormState>,
              AsyncValue<SupplierFormState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(supplierId: _$args));
  }
}

@ProviderFor(SupplierListController)
final supplierListControllerProvider = SupplierListControllerFamily._();

final class SupplierListControllerProvider
    extends $AsyncNotifierProvider<SupplierListController, SupplierListState> {
  SupplierListControllerProvider._({
    required SupplierListControllerFamily super.from,
    required SupplierFilterScope super.argument,
  }) : super(
         retry: null,
         name: r'supplierListControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$supplierListControllerHash();

  @override
  String toString() {
    return r'supplierListControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SupplierListController create() => SupplierListController();

  @override
  bool operator ==(Object other) {
    return other is SupplierListControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$supplierListControllerHash() =>
    r'0da1c2872491c66c613b952a455dfe5dab8d4030';

final class SupplierListControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          SupplierListController,
          AsyncValue<SupplierListState>,
          SupplierListState,
          FutureOr<SupplierListState>,
          SupplierFilterScope
        > {
  SupplierListControllerFamily._()
    : super(
        retry: null,
        name: r'supplierListControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SupplierListControllerProvider call(SupplierFilterScope scope) =>
      SupplierListControllerProvider._(argument: scope, from: this);

  @override
  String toString() => r'supplierListControllerProvider';
}

abstract class _$SupplierListController
    extends $AsyncNotifier<SupplierListState> {
  late final _$args = ref.$arg as SupplierFilterScope;
  SupplierFilterScope get scope => _$args;

  FutureOr<SupplierListState> build(SupplierFilterScope scope);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<SupplierListState>, SupplierListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SupplierListState>, SupplierListState>,
              AsyncValue<SupplierListState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(SupplierSubmitController)
final supplierSubmitControllerProvider = SupplierSubmitControllerProvider._();

final class SupplierSubmitControllerProvider
    extends $NotifierProvider<SupplierSubmitController, SupplierSubmitState> {
  SupplierSubmitControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supplierSubmitControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supplierSubmitControllerHash();

  @$internal
  @override
  SupplierSubmitController create() => SupplierSubmitController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupplierSubmitState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupplierSubmitState>(value),
    );
  }
}

String _$supplierSubmitControllerHash() =>
    r'a30b1ab138a70721befddb9845cbd68a7cf19bd6';

abstract class _$SupplierSubmitController
    extends $Notifier<SupplierSubmitState> {
  SupplierSubmitState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SupplierSubmitState, SupplierSubmitState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SupplierSubmitState, SupplierSubmitState>,
              SupplierSubmitState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ReportFormController)
final reportFormControllerProvider = ReportFormControllerFamily._();

final class ReportFormControllerProvider
    extends $AsyncNotifierProvider<ReportFormController, ReportFormState> {
  ReportFormControllerProvider._({
    required ReportFormControllerFamily super.from,
    required ({int projectId, int? reportId, int? scheduleId}) super.argument,
  }) : super(
         retry: null,
         name: r'reportFormControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reportFormControllerHash();

  @override
  String toString() {
    return r'reportFormControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ReportFormController create() => ReportFormController();

  @override
  bool operator ==(Object other) {
    return other is ReportFormControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reportFormControllerHash() =>
    r'1b63f75594206872b036e42ec9e2723d68b60bdf';

final class ReportFormControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ReportFormController,
          AsyncValue<ReportFormState>,
          ReportFormState,
          FutureOr<ReportFormState>,
          ({int projectId, int? reportId, int? scheduleId})
        > {
  ReportFormControllerFamily._()
    : super(
        retry: null,
        name: r'reportFormControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReportFormControllerProvider call({
    required int projectId,
    int? reportId,
    int? scheduleId,
  }) => ReportFormControllerProvider._(
    argument: (
      projectId: projectId,
      reportId: reportId,
      scheduleId: scheduleId,
    ),
    from: this,
  );

  @override
  String toString() => r'reportFormControllerProvider';
}

abstract class _$ReportFormController extends $AsyncNotifier<ReportFormState> {
  late final _$args =
      ref.$arg as ({int projectId, int? reportId, int? scheduleId});
  int get projectId => _$args.projectId;
  int? get reportId => _$args.reportId;
  int? get scheduleId => _$args.scheduleId;

  FutureOr<ReportFormState> build({
    required int projectId,
    int? reportId,
    int? scheduleId,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ReportFormState>, ReportFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ReportFormState>, ReportFormState>,
              AsyncValue<ReportFormState>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(
        projectId: _$args.projectId,
        reportId: _$args.reportId,
        scheduleId: _$args.scheduleId,
      ),
    );
  }
}

@ProviderFor(ReportListController)
final reportListControllerProvider = ReportListControllerFamily._();

final class ReportListControllerProvider
    extends $AsyncNotifierProvider<ReportListController, ReportListState> {
  ReportListControllerProvider._({
    required ReportListControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'reportListControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reportListControllerHash();

  @override
  String toString() {
    return r'reportListControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ReportListController create() => ReportListController();

  @override
  bool operator ==(Object other) {
    return other is ReportListControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reportListControllerHash() =>
    r'ddf3c4d2133da23d90df957322ce3e7c374df491';

final class ReportListControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ReportListController,
          AsyncValue<ReportListState>,
          ReportListState,
          FutureOr<ReportListState>,
          int
        > {
  ReportListControllerFamily._()
    : super(
        retry: null,
        name: r'reportListControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReportListControllerProvider call({required int projectId}) =>
      ReportListControllerProvider._(argument: projectId, from: this);

  @override
  String toString() => r'reportListControllerProvider';
}

abstract class _$ReportListController extends $AsyncNotifier<ReportListState> {
  late final _$args = ref.$arg as int;
  int get projectId => _$args;

  FutureOr<ReportListState> build({required int projectId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ReportListState>, ReportListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ReportListState>, ReportListState>,
              AsyncValue<ReportListState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(projectId: _$args));
  }
}

@ProviderFor(ReportSubmitController)
final reportSubmitControllerProvider = ReportSubmitControllerProvider._();

final class ReportSubmitControllerProvider
    extends $NotifierProvider<ReportSubmitController, ReportSubmitState> {
  ReportSubmitControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportSubmitControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportSubmitControllerHash();

  @$internal
  @override
  ReportSubmitController create() => ReportSubmitController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReportSubmitState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReportSubmitState>(value),
    );
  }
}

String _$reportSubmitControllerHash() =>
    r'2754a83da2559cfa828e917372828f20d960dff3';

abstract class _$ReportSubmitController extends $Notifier<ReportSubmitState> {
  ReportSubmitState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ReportSubmitState, ReportSubmitState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ReportSubmitState, ReportSubmitState>,
              ReportSubmitState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ReportValidationController)
final reportValidationControllerProvider =
    ReportValidationControllerProvider._();

final class ReportValidationControllerProvider
    extends
        $NotifierProvider<ReportValidationController, ReportValidationState> {
  ReportValidationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportValidationControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportValidationControllerHash();

  @$internal
  @override
  ReportValidationController create() => ReportValidationController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReportValidationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReportValidationState>(value),
    );
  }
}

String _$reportValidationControllerHash() =>
    r'f0a26b304c3d374d9a80eaeb8c292f8e031a1dbf';

abstract class _$ReportValidationController
    extends $Notifier<ReportValidationState> {
  ReportValidationState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ReportValidationState, ReportValidationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ReportValidationState, ReportValidationState>,
              ReportValidationState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(TripExportController)
final tripExportControllerProvider = TripExportControllerProvider._();

final class TripExportControllerProvider
    extends $NotifierProvider<TripExportController, TripExportState> {
  TripExportControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripExportControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripExportControllerHash();

  @$internal
  @override
  TripExportController create() => TripExportController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripExportState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripExportState>(value),
    );
  }
}

String _$tripExportControllerHash() =>
    r'1bf0d24f38fe771904aa171727eeabb6acbfc1a1';

abstract class _$TripExportController extends $Notifier<TripExportState> {
  TripExportState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<TripExportState, TripExportState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TripExportState, TripExportState>,
              TripExportState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(TripOptionsController)
final tripOptionsControllerProvider = TripOptionsControllerFamily._();

final class TripOptionsControllerProvider
    extends $AsyncNotifierProvider<TripOptionsController, TripOptionsState> {
  TripOptionsControllerProvider._({
    required TripOptionsControllerFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'tripOptionsControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tripOptionsControllerHash();

  @override
  String toString() {
    return r'tripOptionsControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TripOptionsController create() => TripOptionsController();

  @override
  bool operator ==(Object other) {
    return other is TripOptionsControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripOptionsControllerHash() =>
    r'cc222fb0da167c378d126f08f40bd8ad3ade32d4';

final class TripOptionsControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          TripOptionsController,
          AsyncValue<TripOptionsState>,
          TripOptionsState,
          FutureOr<TripOptionsState>,
          int?
        > {
  TripOptionsControllerFamily._()
    : super(
        retry: null,
        name: r'tripOptionsControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TripOptionsControllerProvider call({int? categoryId}) =>
      TripOptionsControllerProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'tripOptionsControllerProvider';
}

abstract class _$TripOptionsController
    extends $AsyncNotifier<TripOptionsState> {
  late final _$args = ref.$arg as int?;
  int? get categoryId => _$args;

  FutureOr<TripOptionsState> build({int? categoryId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<TripOptionsState>, TripOptionsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TripOptionsState>, TripOptionsState>,
              AsyncValue<TripOptionsState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(categoryId: _$args));
  }
}

@ProviderFor(TripStepController)
final tripStepControllerProvider = TripStepControllerProvider._();

final class TripStepControllerProvider
    extends $NotifierProvider<TripStepController, TripStepState> {
  TripStepControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripStepControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripStepControllerHash();

  @$internal
  @override
  TripStepController create() => TripStepController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripStepState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripStepState>(value),
    );
  }
}

String _$tripStepControllerHash() =>
    r'876d0392e32a7ac37aa8cd3c1bb905c8de85f69f';

abstract class _$TripStepController extends $Notifier<TripStepState> {
  TripStepState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<TripStepState, TripStepState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TripStepState, TripStepState>,
              TripStepState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(UserFilterController)
final userFilterControllerProvider = UserFilterControllerFamily._();

final class UserFilterControllerProvider
    extends $AsyncNotifierProvider<UserFilterController, UserFilterState> {
  UserFilterControllerProvider._({
    required UserFilterControllerFamily super.from,
    required UserFilterScope super.argument,
  }) : super(
         retry: null,
         name: r'userFilterControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userFilterControllerHash();

  @override
  String toString() {
    return r'userFilterControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  UserFilterController create() => UserFilterController();

  @override
  bool operator ==(Object other) {
    return other is UserFilterControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userFilterControllerHash() =>
    r'1a8b60ee7fee34f1fb72d9c5efa0293707e6845e';

final class UserFilterControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          UserFilterController,
          AsyncValue<UserFilterState>,
          UserFilterState,
          FutureOr<UserFilterState>,
          UserFilterScope
        > {
  UserFilterControllerFamily._()
    : super(
        retry: null,
        name: r'userFilterControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserFilterControllerProvider call(UserFilterScope scope) =>
      UserFilterControllerProvider._(argument: scope, from: this);

  @override
  String toString() => r'userFilterControllerProvider';
}

abstract class _$UserFilterController extends $AsyncNotifier<UserFilterState> {
  late final _$args = ref.$arg as UserFilterScope;
  UserFilterScope get scope => _$args;

  FutureOr<UserFilterState> build(UserFilterScope scope);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<UserFilterState>, UserFilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserFilterState>, UserFilterState>,
              AsyncValue<UserFilterState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(UserFormController)
final userFormControllerProvider = UserFormControllerFamily._();

final class UserFormControllerProvider
    extends $AsyncNotifierProvider<UserFormController, UserFormState> {
  UserFormControllerProvider._({
    required UserFormControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'userFormControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userFormControllerHash();

  @override
  String toString() {
    return r'userFormControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  UserFormController create() => UserFormController();

  @override
  bool operator ==(Object other) {
    return other is UserFormControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userFormControllerHash() =>
    r'acf63190e61d301af7156f19abf73fe12e6c1a92';

final class UserFormControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          UserFormController,
          AsyncValue<UserFormState>,
          UserFormState,
          FutureOr<UserFormState>,
          int
        > {
  UserFormControllerFamily._()
    : super(
        retry: null,
        name: r'userFormControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserFormControllerProvider call({required int userId}) =>
      UserFormControllerProvider._(argument: userId, from: this);

  @override
  String toString() => r'userFormControllerProvider';
}

abstract class _$UserFormController extends $AsyncNotifier<UserFormState> {
  late final _$args = ref.$arg as int;
  int get userId => _$args;

  FutureOr<UserFormState> build({required int userId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<UserFormState>, UserFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserFormState>, UserFormState>,
              AsyncValue<UserFormState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(userId: _$args));
  }
}

@ProviderFor(UserListController)
final userListControllerProvider = UserListControllerFamily._();

final class UserListControllerProvider
    extends $AsyncNotifierProvider<UserListController, UserListState> {
  UserListControllerProvider._({
    required UserListControllerFamily super.from,
    required UserFilterScope super.argument,
  }) : super(
         retry: null,
         name: r'userListControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userListControllerHash();

  @override
  String toString() {
    return r'userListControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  UserListController create() => UserListController();

  @override
  bool operator ==(Object other) {
    return other is UserListControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userListControllerHash() =>
    r'c92e0ec056d1c9dc76087953b7bd02f1fa8ef554';

final class UserListControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          UserListController,
          AsyncValue<UserListState>,
          UserListState,
          FutureOr<UserListState>,
          UserFilterScope
        > {
  UserListControllerFamily._()
    : super(
        retry: null,
        name: r'userListControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserListControllerProvider call(UserFilterScope scope) =>
      UserListControllerProvider._(argument: scope, from: this);

  @override
  String toString() => r'userListControllerProvider';
}

abstract class _$UserListController extends $AsyncNotifier<UserListState> {
  late final _$args = ref.$arg as UserFilterScope;
  UserFilterScope get scope => _$args;

  FutureOr<UserListState> build(UserFilterScope scope);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<UserListState>, UserListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserListState>, UserListState>,
              AsyncValue<UserListState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(UserOptionsController)
final userOptionsControllerProvider = UserOptionsControllerProvider._();

final class UserOptionsControllerProvider
    extends $AsyncNotifierProvider<UserOptionsController, UserOptionsState> {
  UserOptionsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userOptionsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userOptionsControllerHash();

  @$internal
  @override
  UserOptionsController create() => UserOptionsController();
}

String _$userOptionsControllerHash() =>
    r'f375af9c900b06c6a7bdcbae357eab177bf8931b';

abstract class _$UserOptionsController
    extends $AsyncNotifier<UserOptionsState> {
  FutureOr<UserOptionsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<UserOptionsState>, UserOptionsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserOptionsState>, UserOptionsState>,
              AsyncValue<UserOptionsState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(UserSubmitController)
final userSubmitControllerProvider = UserSubmitControllerProvider._();

final class UserSubmitControllerProvider
    extends $NotifierProvider<UserSubmitController, UserSubmitState> {
  UserSubmitControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userSubmitControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userSubmitControllerHash();

  @$internal
  @override
  UserSubmitController create() => UserSubmitController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserSubmitState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserSubmitState>(value),
    );
  }
}

String _$userSubmitControllerHash() =>
    r'4c1b316067c727419dbbee1d149e85f40422ce80';

abstract class _$UserSubmitController extends $Notifier<UserSubmitState> {
  UserSubmitState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<UserSubmitState, UserSubmitState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserSubmitState, UserSubmitState>,
              UserSubmitState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(WorkFilterController)
final workFilterControllerProvider = WorkFilterControllerProvider._();

final class WorkFilterControllerProvider
    extends $AsyncNotifierProvider<WorkFilterController, WorkFilterState> {
  WorkFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workFilterControllerHash();

  @$internal
  @override
  WorkFilterController create() => WorkFilterController();
}

String _$workFilterControllerHash() =>
    r'4a5c80691a26145dc1e355ec41580ea2b1650c48';

abstract class _$WorkFilterController extends $AsyncNotifier<WorkFilterState> {
  FutureOr<WorkFilterState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<WorkFilterState>, WorkFilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WorkFilterState>, WorkFilterState>,
              AsyncValue<WorkFilterState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
