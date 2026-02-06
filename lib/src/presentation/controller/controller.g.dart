// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplierSearchIdle _$SupplierSearchIdleFromJson(Map<String, dynamic> json) =>
    SupplierSearchIdle($type: json['runtimeType'] as String?);

Map<String, dynamic> _$SupplierSearchIdleToJson(SupplierSearchIdle instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

SupplierSearchWaiting _$SupplierSearchWaitingFromJson(
  Map<String, dynamic> json,
) => SupplierSearchWaiting(
  search: json['search'] as String? ?? '',
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SupplierSearchWaitingToJson(
  SupplierSearchWaiting instance,
) => <String, dynamic>{
  'search': instance.search,
  'runtimeType': instance.$type,
};

SupplierSearchResult _$SupplierSearchResultFromJson(
  Map<String, dynamic> json,
) => SupplierSearchResult(
  search: json['search'] as String? ?? '',
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => Supplier.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  page: (json['page'] as num?)?.toInt() ?? 0,
  total: (json['total'] as num?)?.toInt() ?? 0,
  hasReachEnd: json['hasReachEnd'] as bool? ?? false,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SupplierSearchResultToJson(
  SupplierSearchResult instance,
) => <String, dynamic>{
  'search': instance.search,
  'items': instance.items,
  'page': instance.page,
  'total': instance.total,
  'hasReachEnd': instance.hasReachEnd,
  'runtimeType': instance.$type,
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$authControllerHash() => r'dd14ea33b7e63ac8d1a44af4903b577635c107d9';

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
    r'c176d9d4c4f8b6804b1b517d3728cc611aeb6dfe';

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

String _$errorControllerHash() => r'9197bb805cb6936dde4c24d83222c888069ef0e3';

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
    r'c4a53f7561adc0c900da2a084e23cb8289d692ea';

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
    r'0a4ee28345d8dcccbe7b379577ea95fcc04e8176';

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
    r'c3ca22cd40a953f5617ba0ef618ff8c2459e4ead';

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
    r'e7d5d09115c04140a0c241adb07342b4c5f9366e';

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
    r'66629425e3d5033316ec4ff3217046349cd08efc';

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
    r'30bf1d013931a584b4e0dda37fa3ae0b9e3c28dc';

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
    r'5fde8e29250d1abef1ef5d67413347de8e5d43fc';

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
    r'3822f77442442e97faaa933e11c646e670d28acc';

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
    r'78d143b8e324fed507d5c45da0608806b09a32e9';

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

@ProviderFor(SettingFilterController)
final settingFilterControllerProvider = SettingFilterControllerProvider._();

final class SettingFilterControllerProvider
    extends
        $AsyncNotifierProvider<SettingFilterController, SettingFilterState> {
  SettingFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingFilterControllerHash();

  @$internal
  @override
  SettingFilterController create() => SettingFilterController();
}

String _$settingFilterControllerHash() =>
    r'a7957f6695dcbb949a0cd4d045fbce073a2d2aaf';

abstract class _$SettingFilterController
    extends $AsyncNotifier<SettingFilterState> {
  FutureOr<SettingFilterState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<SettingFilterState>, SettingFilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SettingFilterState>, SettingFilterState>,
              AsyncValue<SettingFilterState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SupplierSearchController)
final supplierSearchControllerProvider = SupplierSearchControllerProvider._();

final class SupplierSearchControllerProvider
    extends $NotifierProvider<SupplierSearchController, SupplierSearchState> {
  SupplierSearchControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supplierSearchControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supplierSearchControllerHash();

  @$internal
  @override
  SupplierSearchController create() => SupplierSearchController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupplierSearchState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupplierSearchState>(value),
    );
  }
}

String _$supplierSearchControllerHash() =>
    r'312b3883addff0121c4c865d7de98dc5f89152df';

abstract class _$SupplierSearchController
    extends $Notifier<SupplierSearchState> {
  SupplierSearchState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SupplierSearchState, SupplierSearchState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SupplierSearchState, SupplierSearchState>,
              SupplierSearchState,
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
    r'82b90c88c5eb03414b6ede23f0695d5dd9ba9657';

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
    r'70db2ea71e088b352510703d9fe47777f62e7ec4';

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
    r'c659b0b33503aa1017549ef0d10ebf245939f5d3';

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

@ProviderFor(TripPreviewController)
final tripPreviewControllerProvider = TripPreviewControllerProvider._();

final class TripPreviewControllerProvider
    extends $NotifierProvider<TripPreviewController, TripPreviewState> {
  TripPreviewControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripPreviewControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripPreviewControllerHash();

  @$internal
  @override
  TripPreviewController create() => TripPreviewController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripPreviewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripPreviewState>(value),
    );
  }
}

String _$tripPreviewControllerHash() =>
    r'4a9b78b1ce1ca97542a97a2e104273406a7e989a';

abstract class _$TripPreviewController extends $Notifier<TripPreviewState> {
  TripPreviewState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<TripPreviewState, TripPreviewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TripPreviewState, TripPreviewState>,
              TripPreviewState,
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
    r'06ed73cb9872d120c7171a438ef59236a73af944';

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
    r'41c7c7abe0cadd1efd750a40b214960b381285e7';

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
    r'3f0230c45b2e230159d0bc71df44ddd8f5c5cac3';

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
