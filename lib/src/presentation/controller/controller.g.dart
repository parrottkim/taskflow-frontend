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
    r'e4d2b64368957f5902661f8f7b43cd8040dee21f';

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
    r'0e999bb1f12a9b9f1919938757e1ddcb7eededbf';

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

String _$errorControllerHash() => r'23c6bc19607ea19a5d6624d8ed50371e46c0fbbd';

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

@ProviderFor(IssueFilterController)
final issueFilterControllerProvider = IssueFilterControllerProvider._();

final class IssueFilterControllerProvider
    extends $AsyncNotifierProvider<IssueFilterController, IssueFilterState> {
  IssueFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'issueFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$issueFilterControllerHash();

  @$internal
  @override
  IssueFilterController create() => IssueFilterController();
}

String _$issueFilterControllerHash() =>
    r'8922915af471bb69c131b222b3d452949a9d3ac0';

abstract class _$IssueFilterController
    extends $AsyncNotifier<IssueFilterState> {
  FutureOr<IssueFilterState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<IssueFilterState>, IssueFilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<IssueFilterState>, IssueFilterState>,
              AsyncValue<IssueFilterState>,
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
    r'de2a2b39ecdd816c0c2e81e11459176413b6c5b8';

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
    r'b7537f314f057507f0c888c704a9e6677e0e3ec2';

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
    r'01ad932d78303d3c765b15f776308f7f6e956c9d';

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
    required int super.argument,
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
        '($argument)';
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
    r'098c22ae62eaccabd10f6b4d399cb8ca9ab37d9a';

final class ProcurementIssueFormControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ProcurementIssueFormController,
          AsyncValue<ProcurementIssueFormState>,
          ProcurementIssueFormState,
          FutureOr<ProcurementIssueFormState>,
          int
        > {
  ProcurementIssueFormControllerFamily._()
    : super(
        retry: null,
        name: r'procurementIssueFormControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProcurementIssueFormControllerProvider call({required int issueId}) =>
      ProcurementIssueFormControllerProvider._(argument: issueId, from: this);

  @override
  String toString() => r'procurementIssueFormControllerProvider';
}

abstract class _$ProcurementIssueFormController
    extends $AsyncNotifier<ProcurementIssueFormState> {
  late final _$args = ref.$arg as int;
  int get issueId => _$args;

  FutureOr<ProcurementIssueFormState> build({required int issueId});
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
    element.handleCreate(ref, () => build(issueId: _$args));
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
    r'850fae97e84c22f95c5b420eaf672d8441a98abe';

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
    r'2a4099d4f18aad8c2f4442223229cc078ffa7f25';

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
final projectFilterControllerProvider = ProjectFilterControllerProvider._();

final class ProjectFilterControllerProvider
    extends
        $AsyncNotifierProvider<ProjectFilterController, ProjectFilterState> {
  ProjectFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectFilterControllerHash();

  @$internal
  @override
  ProjectFilterController create() => ProjectFilterController();
}

String _$projectFilterControllerHash() =>
    r'7706f8fd38ef88f27a6e7603b943096200fc7349';

abstract class _$ProjectFilterController
    extends $AsyncNotifier<ProjectFilterState> {
  FutureOr<ProjectFilterState> build();
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
    element.handleCreate(ref, build);
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
    r'c0aeac2510cd43da323b97d855c13bb145a9489f';

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
final projectListControllerProvider = ProjectListControllerProvider._();

final class ProjectListControllerProvider
    extends $AsyncNotifierProvider<ProjectListController, ProjectListState> {
  ProjectListControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectListControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectListControllerHash();

  @$internal
  @override
  ProjectListController create() => ProjectListController();
}

String _$projectListControllerHash() =>
    r'5e0c9ca9d82ea5eca64b76327b8e6bb0f5191b7e';

abstract class _$ProjectListController
    extends $AsyncNotifier<ProjectListState> {
  FutureOr<ProjectListState> build();
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
    r'65ed2688fce925ad94f5f0dd206ebcd95d9d10e6';

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
final scheduleFilterControllerProvider = ScheduleFilterControllerProvider._();

final class ScheduleFilterControllerProvider
    extends
        $AsyncNotifierProvider<ScheduleFilterController, ScheduleFilterState> {
  ScheduleFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scheduleFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scheduleFilterControllerHash();

  @$internal
  @override
  ScheduleFilterController create() => ScheduleFilterController();
}

String _$scheduleFilterControllerHash() =>
    r'1ae033d277cff1ab084f6c548a6f0d074d5304b4';

abstract class _$ScheduleFilterController
    extends $AsyncNotifier<ScheduleFilterState> {
  FutureOr<ScheduleFilterState> build();
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
    element.handleCreate(ref, build);
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
    required int? super.argument,
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
        '($argument)';
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
    r'd5e744c265dcf846d2e9dbd4b04f08c98b416017';

final class ScheduleListControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ScheduleListController,
          AsyncValue<ScheduleListState>,
          ScheduleListState,
          FutureOr<ScheduleListState>,
          int?
        > {
  ScheduleListControllerFamily._()
    : super(
        retry: null,
        name: r'scheduleListControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ScheduleListControllerProvider call({int? projectId}) =>
      ScheduleListControllerProvider._(argument: projectId, from: this);

  @override
  String toString() => r'scheduleListControllerProvider';
}

abstract class _$ScheduleListController
    extends $AsyncNotifier<ScheduleListState> {
  late final _$args = ref.$arg as int?;
  int? get projectId => _$args;

  FutureOr<ScheduleListState> build({int? projectId});
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
    element.handleCreate(ref, () => build(projectId: _$args));
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
    r'5ce32678a6df44e1a80021af1100e85fa61eb346';

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
final supplierFilterControllerProvider = SupplierFilterControllerProvider._();

final class SupplierFilterControllerProvider
    extends
        $AsyncNotifierProvider<SupplierFilterController, SupplierFilterState> {
  SupplierFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supplierFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supplierFilterControllerHash();

  @$internal
  @override
  SupplierFilterController create() => SupplierFilterController();
}

String _$supplierFilterControllerHash() =>
    r'baf344c47c3a297300fd24fd78c176d4e0dcd33f';

abstract class _$SupplierFilterController
    extends $AsyncNotifier<SupplierFilterState> {
  FutureOr<SupplierFilterState> build();
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
    element.handleCreate(ref, build);
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
final supplierListControllerProvider = SupplierListControllerProvider._();

final class SupplierListControllerProvider
    extends $AsyncNotifierProvider<SupplierListController, SupplierListState> {
  SupplierListControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supplierListControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supplierListControllerHash();

  @$internal
  @override
  SupplierListController create() => SupplierListController();
}

String _$supplierListControllerHash() =>
    r'a3f5d192e13b724a5cf61d31c024c7cea39b4099';

abstract class _$SupplierListController
    extends $AsyncNotifier<SupplierListState> {
  FutureOr<SupplierListState> build();
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
    element.handleCreate(ref, build);
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
    r'122fb197bf81120580f7d343197947c5ba07b79e';

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
    r'05bf1bf703e97d4665edfdff8f8a002a76d23ab3';

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
    r'20b64b526dc20ae9eeb174363cde62e2f8495c44';

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

@ProviderFor(TripFilterController)
final tripFilterControllerProvider = TripFilterControllerFamily._();

final class TripFilterControllerProvider
    extends $AsyncNotifierProvider<TripFilterController, TripFilterState> {
  TripFilterControllerProvider._({
    required TripFilterControllerFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'tripFilterControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tripFilterControllerHash();

  @override
  String toString() {
    return r'tripFilterControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TripFilterController create() => TripFilterController();

  @override
  bool operator ==(Object other) {
    return other is TripFilterControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripFilterControllerHash() =>
    r'2d85739e96335e7c7da8bdddb341caa3e14c19d5';

final class TripFilterControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          TripFilterController,
          AsyncValue<TripFilterState>,
          TripFilterState,
          FutureOr<TripFilterState>,
          int?
        > {
  TripFilterControllerFamily._()
    : super(
        retry: null,
        name: r'tripFilterControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TripFilterControllerProvider call({int? categoryId}) =>
      TripFilterControllerProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'tripFilterControllerProvider';
}

abstract class _$TripFilterController extends $AsyncNotifier<TripFilterState> {
  late final _$args = ref.$arg as int?;
  int? get categoryId => _$args;

  FutureOr<TripFilterState> build({int? categoryId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<TripFilterState>, TripFilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TripFilterState>, TripFilterState>,
              AsyncValue<TripFilterState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(categoryId: _$args));
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
final userFilterControllerProvider = UserFilterControllerProvider._();

final class UserFilterControllerProvider
    extends $AsyncNotifierProvider<UserFilterController, UserFilterState> {
  UserFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userFilterControllerHash();

  @$internal
  @override
  UserFilterController create() => UserFilterController();
}

String _$userFilterControllerHash() =>
    r'0a7942f7a0181eaf8e3fe8551c5750c76ff5f55a';

abstract class _$UserFilterController extends $AsyncNotifier<UserFilterState> {
  FutureOr<UserFilterState> build();
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
    element.handleCreate(ref, build);
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
final userListControllerProvider = UserListControllerProvider._();

final class UserListControllerProvider
    extends $AsyncNotifierProvider<UserListController, UserListState> {
  UserListControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userListControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userListControllerHash();

  @$internal
  @override
  UserListController create() => UserListController();
}

String _$userListControllerHash() =>
    r'c7f2f5ddccedb9d9f767ee597acd3c46ec254ab5';

abstract class _$UserListController extends $AsyncNotifier<UserListState> {
  FutureOr<UserListState> build();
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
    r'edac99f0a38e79e74aaed51949f235180e13c9df';

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
    r'094062e6dc72102555139f8c5c6b52d1d0de107a';

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
