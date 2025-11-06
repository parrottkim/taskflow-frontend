// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplierSearchIdle _$SupplierSearchIdleFromJson(Map<String, dynamic> json) =>
    SupplierSearchIdle(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SupplierSearchIdleToJson(SupplierSearchIdle instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

SupplierSearchWaiting _$SupplierSearchWaitingFromJson(
        Map<String, dynamic> json) =>
    SupplierSearchWaiting(
      search: json['search'] as String? ?? '',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SupplierSearchWaitingToJson(
        SupplierSearchWaiting instance) =>
    <String, dynamic>{
      'search': instance.search,
      'runtimeType': instance.$type,
    };

SupplierSearchResult _$SupplierSearchResultFromJson(
        Map<String, dynamic> json) =>
    SupplierSearchResult(
      search: json['search'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => Supplier.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      page: (json['page'] as num?)?.toInt() ?? 0,
      total: (json['total'] as num?)?.toInt() ?? 0,
      hasReachEnd: json['hasReachEnd'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SupplierSearchResultToJson(
        SupplierSearchResult instance) =>
    <String, dynamic>{
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

String _$authControllerHash() => r'350f03c99fe36b8e813e3de8be485e26bbbf1b6b';

/// See also [AuthController].
@ProviderFor(AuthController)
final authControllerProvider =
    AutoDisposeNotifierProvider<AuthController, AuthState>.internal(
  AuthController.new,
  name: r'authControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthController = AutoDisposeNotifier<AuthState>;
String _$calendarControllerHash() =>
    r'fc4124caa85f6b5b5269d4cbf92b55a5b8d55e1e';

/// See also [CalendarController].
@ProviderFor(CalendarController)
final calendarControllerProvider = AutoDisposeAsyncNotifierProvider<
    CalendarController, CalendarState>.internal(
  CalendarController.new,
  name: r'calendarControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calendarControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CalendarController = AutoDisposeAsyncNotifier<CalendarState>;
String _$dateSelectionControllerHash() =>
    r'5ad2c01e41c1512f50a695209446182953241701';

/// See also [DateSelectionController].
@ProviderFor(DateSelectionController)
final dateSelectionControllerProvider = AutoDisposeNotifierProvider<
    DateSelectionController, DateSelectionState>.internal(
  DateSelectionController.new,
  name: r'dateSelectionControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dateSelectionControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DateSelectionController = AutoDisposeNotifier<DateSelectionState>;
String _$latestUpdateControllerHash() =>
    r'6236a34a4a29b9538c5553fbffb176d1759acfb6';

/// See also [LatestUpdateController].
@ProviderFor(LatestUpdateController)
final latestUpdateControllerProvider = AutoDisposeAsyncNotifierProvider<
    LatestUpdateController, LatestUpdateState>.internal(
  LatestUpdateController.new,
  name: r'latestUpdateControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$latestUpdateControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LatestUpdateController = AutoDisposeAsyncNotifier<LatestUpdateState>;
String _$projectStatsControllerHash() =>
    r'5cf0bfd5e70a65e5442bd80827df04f287d1a7fe';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ProjectStatsController
    extends BuildlessAutoDisposeAsyncNotifier<ProjectStatsState> {
  late final DateTime start;
  late final DateTime end;

  FutureOr<ProjectStatsState> build({
    required DateTime start,
    required DateTime end,
  });
}

/// See also [ProjectStatsController].
@ProviderFor(ProjectStatsController)
const projectStatsControllerProvider = ProjectStatsControllerFamily();

/// See also [ProjectStatsController].
class ProjectStatsControllerFamily
    extends Family<AsyncValue<ProjectStatsState>> {
  /// See also [ProjectStatsController].
  const ProjectStatsControllerFamily();

  /// See also [ProjectStatsController].
  ProjectStatsControllerProvider call({
    required DateTime start,
    required DateTime end,
  }) {
    return ProjectStatsControllerProvider(
      start: start,
      end: end,
    );
  }

  @override
  ProjectStatsControllerProvider getProviderOverride(
    covariant ProjectStatsControllerProvider provider,
  ) {
    return call(
      start: provider.start,
      end: provider.end,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'projectStatsControllerProvider';
}

/// See also [ProjectStatsController].
class ProjectStatsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProjectStatsController,
        ProjectStatsState> {
  /// See also [ProjectStatsController].
  ProjectStatsControllerProvider({
    required DateTime start,
    required DateTime end,
  }) : this._internal(
          () => ProjectStatsController()
            ..start = start
            ..end = end,
          from: projectStatsControllerProvider,
          name: r'projectStatsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectStatsControllerHash,
          dependencies: ProjectStatsControllerFamily._dependencies,
          allTransitiveDependencies:
              ProjectStatsControllerFamily._allTransitiveDependencies,
          start: start,
          end: end,
        );

  ProjectStatsControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.start,
    required this.end,
  }) : super.internal();

  final DateTime start;
  final DateTime end;

  @override
  FutureOr<ProjectStatsState> runNotifierBuild(
    covariant ProjectStatsController notifier,
  ) {
    return notifier.build(
      start: start,
      end: end,
    );
  }

  @override
  Override overrideWith(ProjectStatsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProjectStatsControllerProvider._internal(
        () => create()
          ..start = start
          ..end = end,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        start: start,
        end: end,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProjectStatsController,
      ProjectStatsState> createElement() {
    return _ProjectStatsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectStatsControllerProvider &&
        other.start == start &&
        other.end == end;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, start.hashCode);
    hash = _SystemHash.combine(hash, end.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProjectStatsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ProjectStatsState> {
  /// The parameter `start` of this provider.
  DateTime get start;

  /// The parameter `end` of this provider.
  DateTime get end;
}

class _ProjectStatsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProjectStatsController,
        ProjectStatsState> with ProjectStatsControllerRef {
  _ProjectStatsControllerProviderElement(super.provider);

  @override
  DateTime get start => (origin as ProjectStatsControllerProvider).start;
  @override
  DateTime get end => (origin as ProjectStatsControllerProvider).end;
}

String _$summaryControllerHash() => r'd5d1b5735c1b51b6ad5b58821f8d1cea7d9ee218';

abstract class _$SummaryController
    extends BuildlessAutoDisposeAsyncNotifier<SummaryState> {
  late final DateTime start;
  late final DateTime end;

  FutureOr<SummaryState> build({
    required DateTime start,
    required DateTime end,
  });
}

/// See also [SummaryController].
@ProviderFor(SummaryController)
const summaryControllerProvider = SummaryControllerFamily();

/// See also [SummaryController].
class SummaryControllerFamily extends Family<AsyncValue<SummaryState>> {
  /// See also [SummaryController].
  const SummaryControllerFamily();

  /// See also [SummaryController].
  SummaryControllerProvider call({
    required DateTime start,
    required DateTime end,
  }) {
    return SummaryControllerProvider(
      start: start,
      end: end,
    );
  }

  @override
  SummaryControllerProvider getProviderOverride(
    covariant SummaryControllerProvider provider,
  ) {
    return call(
      start: provider.start,
      end: provider.end,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'summaryControllerProvider';
}

/// See also [SummaryController].
class SummaryControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SummaryController, SummaryState> {
  /// See also [SummaryController].
  SummaryControllerProvider({
    required DateTime start,
    required DateTime end,
  }) : this._internal(
          () => SummaryController()
            ..start = start
            ..end = end,
          from: summaryControllerProvider,
          name: r'summaryControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$summaryControllerHash,
          dependencies: SummaryControllerFamily._dependencies,
          allTransitiveDependencies:
              SummaryControllerFamily._allTransitiveDependencies,
          start: start,
          end: end,
        );

  SummaryControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.start,
    required this.end,
  }) : super.internal();

  final DateTime start;
  final DateTime end;

  @override
  FutureOr<SummaryState> runNotifierBuild(
    covariant SummaryController notifier,
  ) {
    return notifier.build(
      start: start,
      end: end,
    );
  }

  @override
  Override overrideWith(SummaryController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SummaryControllerProvider._internal(
        () => create()
          ..start = start
          ..end = end,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        start: start,
        end: end,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SummaryController, SummaryState>
      createElement() {
    return _SummaryControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SummaryControllerProvider &&
        other.start == start &&
        other.end == end;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, start.hashCode);
    hash = _SystemHash.combine(hash, end.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SummaryControllerRef
    on AutoDisposeAsyncNotifierProviderRef<SummaryState> {
  /// The parameter `start` of this provider.
  DateTime get start;

  /// The parameter `end` of this provider.
  DateTime get end;
}

class _SummaryControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SummaryController,
        SummaryState> with SummaryControllerRef {
  _SummaryControllerProviderElement(super.provider);

  @override
  DateTime get start => (origin as SummaryControllerProvider).start;
  @override
  DateTime get end => (origin as SummaryControllerProvider).end;
}

String _$worldMapControllerHash() =>
    r'a2691e0d9196b8e9e630e8cae7c58db723055e49';

/// See also [WorldMapController].
@ProviderFor(WorldMapController)
final worldMapControllerProvider = AutoDisposeAsyncNotifierProvider<
    WorldMapController, WorldMapState>.internal(
  WorldMapController.new,
  name: r'worldMapControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$worldMapControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WorldMapController = AutoDisposeAsyncNotifier<WorldMapState>;
String _$downloadControllerHash() =>
    r'ff5f1051616ed9e219c896a35ccf5f0127d2b373';

abstract class _$DownloadController
    extends BuildlessAutoDisposeAsyncNotifier<DownloadState> {
  late final String? path;
  late final String? filename;

  FutureOr<DownloadState> build({
    String? path,
    String? filename,
  });
}

/// See also [DownloadController].
@ProviderFor(DownloadController)
const downloadControllerProvider = DownloadControllerFamily();

/// See also [DownloadController].
class DownloadControllerFamily extends Family<AsyncValue<DownloadState>> {
  /// See also [DownloadController].
  const DownloadControllerFamily();

  /// See also [DownloadController].
  DownloadControllerProvider call({
    String? path,
    String? filename,
  }) {
    return DownloadControllerProvider(
      path: path,
      filename: filename,
    );
  }

  @override
  DownloadControllerProvider getProviderOverride(
    covariant DownloadControllerProvider provider,
  ) {
    return call(
      path: provider.path,
      filename: provider.filename,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'downloadControllerProvider';
}

/// See also [DownloadController].
class DownloadControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    DownloadController, DownloadState> {
  /// See also [DownloadController].
  DownloadControllerProvider({
    String? path,
    String? filename,
  }) : this._internal(
          () => DownloadController()
            ..path = path
            ..filename = filename,
          from: downloadControllerProvider,
          name: r'downloadControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$downloadControllerHash,
          dependencies: DownloadControllerFamily._dependencies,
          allTransitiveDependencies:
              DownloadControllerFamily._allTransitiveDependencies,
          path: path,
          filename: filename,
        );

  DownloadControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.path,
    required this.filename,
  }) : super.internal();

  final String? path;
  final String? filename;

  @override
  FutureOr<DownloadState> runNotifierBuild(
    covariant DownloadController notifier,
  ) {
    return notifier.build(
      path: path,
      filename: filename,
    );
  }

  @override
  Override overrideWith(DownloadController Function() create) {
    return ProviderOverride(
      origin: this,
      override: DownloadControllerProvider._internal(
        () => create()
          ..path = path
          ..filename = filename,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        path: path,
        filename: filename,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DownloadController, DownloadState>
      createElement() {
    return _DownloadControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DownloadControllerProvider &&
        other.path == path &&
        other.filename == filename;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);
    hash = _SystemHash.combine(hash, filename.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DownloadControllerRef
    on AutoDisposeAsyncNotifierProviderRef<DownloadState> {
  /// The parameter `path` of this provider.
  String? get path;

  /// The parameter `filename` of this provider.
  String? get filename;
}

class _DownloadControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DownloadController,
        DownloadState> with DownloadControllerRef {
  _DownloadControllerProviderElement(super.provider);

  @override
  String? get path => (origin as DownloadControllerProvider).path;
  @override
  String? get filename => (origin as DownloadControllerProvider).filename;
}

String _$errorControllerHash() => r'0fd87ff4f7beae181ea91dd0e6c76efc310afcae';

/// See also [ErrorController].
@ProviderFor(ErrorController)
final errorControllerProvider =
    AutoDisposeNotifierProvider<ErrorController, ErrorState>.internal(
  ErrorController.new,
  name: r'errorControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$errorControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ErrorController = AutoDisposeNotifier<ErrorState>;
String _$issueDetailControllerHash() =>
    r'd40f8c876ff10675633622c04b0c180aeb30d72a';

abstract class _$IssueDetailController
    extends BuildlessAutoDisposeAsyncNotifier<IssueDetailState> {
  late final int issueId;

  FutureOr<IssueDetailState> build({
    required int issueId,
  });
}

/// See also [IssueDetailController].
@ProviderFor(IssueDetailController)
const issueDetailControllerProvider = IssueDetailControllerFamily();

/// See also [IssueDetailController].
class IssueDetailControllerFamily extends Family<AsyncValue<IssueDetailState>> {
  /// See also [IssueDetailController].
  const IssueDetailControllerFamily();

  /// See also [IssueDetailController].
  IssueDetailControllerProvider call({
    required int issueId,
  }) {
    return IssueDetailControllerProvider(
      issueId: issueId,
    );
  }

  @override
  IssueDetailControllerProvider getProviderOverride(
    covariant IssueDetailControllerProvider provider,
  ) {
    return call(
      issueId: provider.issueId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'issueDetailControllerProvider';
}

/// See also [IssueDetailController].
class IssueDetailControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<IssueDetailController,
        IssueDetailState> {
  /// See also [IssueDetailController].
  IssueDetailControllerProvider({
    required int issueId,
  }) : this._internal(
          () => IssueDetailController()..issueId = issueId,
          from: issueDetailControllerProvider,
          name: r'issueDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$issueDetailControllerHash,
          dependencies: IssueDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              IssueDetailControllerFamily._allTransitiveDependencies,
          issueId: issueId,
        );

  IssueDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.issueId,
  }) : super.internal();

  final int issueId;

  @override
  FutureOr<IssueDetailState> runNotifierBuild(
    covariant IssueDetailController notifier,
  ) {
    return notifier.build(
      issueId: issueId,
    );
  }

  @override
  Override overrideWith(IssueDetailController Function() create) {
    return ProviderOverride(
      origin: this,
      override: IssueDetailControllerProvider._internal(
        () => create()..issueId = issueId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        issueId: issueId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<IssueDetailController,
      IssueDetailState> createElement() {
    return _IssueDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IssueDetailControllerProvider && other.issueId == issueId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, issueId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IssueDetailControllerRef
    on AutoDisposeAsyncNotifierProviderRef<IssueDetailState> {
  /// The parameter `issueId` of this provider.
  int get issueId;
}

class _IssueDetailControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<IssueDetailController,
        IssueDetailState> with IssueDetailControllerRef {
  _IssueDetailControllerProviderElement(super.provider);

  @override
  int get issueId => (origin as IssueDetailControllerProvider).issueId;
}

String _$issueFilterControllerHash() =>
    r'0ed6798af0752b7eeac933a5e507513b6c5a16c7';

/// See also [IssueFilterController].
@ProviderFor(IssueFilterController)
final issueFilterControllerProvider = AutoDisposeAsyncNotifierProvider<
    IssueFilterController, IssueFilterState>.internal(
  IssueFilterController.new,
  name: r'issueFilterControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$issueFilterControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IssueFilterController = AutoDisposeAsyncNotifier<IssueFilterState>;
String _$issueFormControllerHash() =>
    r'a278ada2d6733bd744d6fcf0fc11bb4fce62071d';

abstract class _$IssueFormController
    extends BuildlessAutoDisposeAsyncNotifier<IssueFormState> {
  late final int categoryId;
  late final int projectId;
  late final int? issueId;

  FutureOr<IssueFormState> build({
    required int categoryId,
    required int projectId,
    int? issueId,
  });
}

/// See also [IssueFormController].
@ProviderFor(IssueFormController)
const issueFormControllerProvider = IssueFormControllerFamily();

/// See also [IssueFormController].
class IssueFormControllerFamily extends Family<AsyncValue<IssueFormState>> {
  /// See also [IssueFormController].
  const IssueFormControllerFamily();

  /// See also [IssueFormController].
  IssueFormControllerProvider call({
    required int categoryId,
    required int projectId,
    int? issueId,
  }) {
    return IssueFormControllerProvider(
      categoryId: categoryId,
      projectId: projectId,
      issueId: issueId,
    );
  }

  @override
  IssueFormControllerProvider getProviderOverride(
    covariant IssueFormControllerProvider provider,
  ) {
    return call(
      categoryId: provider.categoryId,
      projectId: provider.projectId,
      issueId: provider.issueId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'issueFormControllerProvider';
}

/// See also [IssueFormController].
class IssueFormControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    IssueFormController, IssueFormState> {
  /// See also [IssueFormController].
  IssueFormControllerProvider({
    required int categoryId,
    required int projectId,
    int? issueId,
  }) : this._internal(
          () => IssueFormController()
            ..categoryId = categoryId
            ..projectId = projectId
            ..issueId = issueId,
          from: issueFormControllerProvider,
          name: r'issueFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$issueFormControllerHash,
          dependencies: IssueFormControllerFamily._dependencies,
          allTransitiveDependencies:
              IssueFormControllerFamily._allTransitiveDependencies,
          categoryId: categoryId,
          projectId: projectId,
          issueId: issueId,
        );

  IssueFormControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
    required this.projectId,
    required this.issueId,
  }) : super.internal();

  final int categoryId;
  final int projectId;
  final int? issueId;

  @override
  FutureOr<IssueFormState> runNotifierBuild(
    covariant IssueFormController notifier,
  ) {
    return notifier.build(
      categoryId: categoryId,
      projectId: projectId,
      issueId: issueId,
    );
  }

  @override
  Override overrideWith(IssueFormController Function() create) {
    return ProviderOverride(
      origin: this,
      override: IssueFormControllerProvider._internal(
        () => create()
          ..categoryId = categoryId
          ..projectId = projectId
          ..issueId = issueId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
        projectId: projectId,
        issueId: issueId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<IssueFormController, IssueFormState>
      createElement() {
    return _IssueFormControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IssueFormControllerProvider &&
        other.categoryId == categoryId &&
        other.projectId == projectId &&
        other.issueId == issueId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);
    hash = _SystemHash.combine(hash, issueId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IssueFormControllerRef
    on AutoDisposeAsyncNotifierProviderRef<IssueFormState> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;

  /// The parameter `projectId` of this provider.
  int get projectId;

  /// The parameter `issueId` of this provider.
  int? get issueId;
}

class _IssueFormControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<IssueFormController,
        IssueFormState> with IssueFormControllerRef {
  _IssueFormControllerProviderElement(super.provider);

  @override
  int get categoryId => (origin as IssueFormControllerProvider).categoryId;
  @override
  int get projectId => (origin as IssueFormControllerProvider).projectId;
  @override
  int? get issueId => (origin as IssueFormControllerProvider).issueId;
}

String _$issueListControllerHash() =>
    r'd2535505ffede766e95e1be56740589e2f3f0e0b';

abstract class _$IssueListController
    extends BuildlessAutoDisposeAsyncNotifier<IssueListState> {
  late final int projectId;

  FutureOr<IssueListState> build({
    required int projectId,
  });
}

/// See also [IssueListController].
@ProviderFor(IssueListController)
const issueListControllerProvider = IssueListControllerFamily();

/// See also [IssueListController].
class IssueListControllerFamily extends Family<AsyncValue<IssueListState>> {
  /// See also [IssueListController].
  const IssueListControllerFamily();

  /// See also [IssueListController].
  IssueListControllerProvider call({
    required int projectId,
  }) {
    return IssueListControllerProvider(
      projectId: projectId,
    );
  }

  @override
  IssueListControllerProvider getProviderOverride(
    covariant IssueListControllerProvider provider,
  ) {
    return call(
      projectId: provider.projectId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'issueListControllerProvider';
}

/// See also [IssueListController].
class IssueListControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    IssueListController, IssueListState> {
  /// See also [IssueListController].
  IssueListControllerProvider({
    required int projectId,
  }) : this._internal(
          () => IssueListController()..projectId = projectId,
          from: issueListControllerProvider,
          name: r'issueListControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$issueListControllerHash,
          dependencies: IssueListControllerFamily._dependencies,
          allTransitiveDependencies:
              IssueListControllerFamily._allTransitiveDependencies,
          projectId: projectId,
        );

  IssueListControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectId,
  }) : super.internal();

  final int projectId;

  @override
  FutureOr<IssueListState> runNotifierBuild(
    covariant IssueListController notifier,
  ) {
    return notifier.build(
      projectId: projectId,
    );
  }

  @override
  Override overrideWith(IssueListController Function() create) {
    return ProviderOverride(
      origin: this,
      override: IssueListControllerProvider._internal(
        () => create()..projectId = projectId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectId: projectId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<IssueListController, IssueListState>
      createElement() {
    return _IssueListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IssueListControllerProvider && other.projectId == projectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IssueListControllerRef
    on AutoDisposeAsyncNotifierProviderRef<IssueListState> {
  /// The parameter `projectId` of this provider.
  int get projectId;
}

class _IssueListControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<IssueListController,
        IssueListState> with IssueListControllerRef {
  _IssueListControllerProviderElement(super.provider);

  @override
  int get projectId => (origin as IssueListControllerProvider).projectId;
}

String _$issueSubmitControllerHash() =>
    r'ce5bbad80ef510c82d126b0ebf175aa11c865ac6';

/// See also [IssueSubmitController].
@ProviderFor(IssueSubmitController)
final issueSubmitControllerProvider = AutoDisposeNotifierProvider<
    IssueSubmitController, IssueSubmitState>.internal(
  IssueSubmitController.new,
  name: r'issueSubmitControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$issueSubmitControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IssueSubmitController = AutoDisposeNotifier<IssueSubmitState>;
String _$localControllerHash() => r'32d5283d5a675d0a84f4a13c2b519a8f0a8b6d41';

/// See also [LocalController].
@ProviderFor(LocalController)
final localControllerProvider =
    AutoDisposeAsyncNotifierProvider<LocalController, LocalState>.internal(
  LocalController.new,
  name: r'localControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocalController = AutoDisposeAsyncNotifier<LocalState>;
String _$projectDetailControllerHash() =>
    r'12d9a90039e9e8e0521572bfe4175631ee8bc25a';

abstract class _$ProjectDetailController
    extends BuildlessAutoDisposeAsyncNotifier<ProjectDetailState> {
  late final int projectId;

  FutureOr<ProjectDetailState> build({
    required int projectId,
  });
}

/// See also [ProjectDetailController].
@ProviderFor(ProjectDetailController)
const projectDetailControllerProvider = ProjectDetailControllerFamily();

/// See also [ProjectDetailController].
class ProjectDetailControllerFamily
    extends Family<AsyncValue<ProjectDetailState>> {
  /// See also [ProjectDetailController].
  const ProjectDetailControllerFamily();

  /// See also [ProjectDetailController].
  ProjectDetailControllerProvider call({
    required int projectId,
  }) {
    return ProjectDetailControllerProvider(
      projectId: projectId,
    );
  }

  @override
  ProjectDetailControllerProvider getProviderOverride(
    covariant ProjectDetailControllerProvider provider,
  ) {
    return call(
      projectId: provider.projectId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'projectDetailControllerProvider';
}

/// See also [ProjectDetailController].
class ProjectDetailControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProjectDetailController,
        ProjectDetailState> {
  /// See also [ProjectDetailController].
  ProjectDetailControllerProvider({
    required int projectId,
  }) : this._internal(
          () => ProjectDetailController()..projectId = projectId,
          from: projectDetailControllerProvider,
          name: r'projectDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectDetailControllerHash,
          dependencies: ProjectDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              ProjectDetailControllerFamily._allTransitiveDependencies,
          projectId: projectId,
        );

  ProjectDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectId,
  }) : super.internal();

  final int projectId;

  @override
  FutureOr<ProjectDetailState> runNotifierBuild(
    covariant ProjectDetailController notifier,
  ) {
    return notifier.build(
      projectId: projectId,
    );
  }

  @override
  Override overrideWith(ProjectDetailController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProjectDetailControllerProvider._internal(
        () => create()..projectId = projectId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectId: projectId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProjectDetailController,
      ProjectDetailState> createElement() {
    return _ProjectDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectDetailControllerProvider &&
        other.projectId == projectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProjectDetailControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ProjectDetailState> {
  /// The parameter `projectId` of this provider.
  int get projectId;
}

class _ProjectDetailControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProjectDetailController,
        ProjectDetailState> with ProjectDetailControllerRef {
  _ProjectDetailControllerProviderElement(super.provider);

  @override
  int get projectId => (origin as ProjectDetailControllerProvider).projectId;
}

String _$projectDetailFilterControllerHash() =>
    r'0f746e52aba244cb812e34ee06857bdedcfe2cec';

/// See also [ProjectDetailFilterController].
@ProviderFor(ProjectDetailFilterController)
final projectDetailFilterControllerProvider = AutoDisposeAsyncNotifierProvider<
    ProjectDetailFilterController, ProjectDetailFilterState>.internal(
  ProjectDetailFilterController.new,
  name: r'projectDetailFilterControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectDetailFilterControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProjectDetailFilterController
    = AutoDisposeAsyncNotifier<ProjectDetailFilterState>;
String _$projectFilterControllerHash() =>
    r'e45c32f8cf79a1a9b73647cd9fdaa4c160b6096c';

/// See also [ProjectFilterController].
@ProviderFor(ProjectFilterController)
final projectFilterControllerProvider = AutoDisposeAsyncNotifierProvider<
    ProjectFilterController, ProjectFilterState>.internal(
  ProjectFilterController.new,
  name: r'projectFilterControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectFilterControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProjectFilterController
    = AutoDisposeAsyncNotifier<ProjectFilterState>;
String _$projectFormControllerHash() =>
    r'a7a20b55a3815c3a09013cc9088e0dc31b69703f';

abstract class _$ProjectFormController
    extends BuildlessAutoDisposeAsyncNotifier<ProjectFormState> {
  late final int? projectId;

  FutureOr<ProjectFormState> build({
    int? projectId,
  });
}

/// See also [ProjectFormController].
@ProviderFor(ProjectFormController)
const projectFormControllerProvider = ProjectFormControllerFamily();

/// See also [ProjectFormController].
class ProjectFormControllerFamily extends Family<AsyncValue<ProjectFormState>> {
  /// See also [ProjectFormController].
  const ProjectFormControllerFamily();

  /// See also [ProjectFormController].
  ProjectFormControllerProvider call({
    int? projectId,
  }) {
    return ProjectFormControllerProvider(
      projectId: projectId,
    );
  }

  @override
  ProjectFormControllerProvider getProviderOverride(
    covariant ProjectFormControllerProvider provider,
  ) {
    return call(
      projectId: provider.projectId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'projectFormControllerProvider';
}

/// See also [ProjectFormController].
class ProjectFormControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProjectFormController,
        ProjectFormState> {
  /// See also [ProjectFormController].
  ProjectFormControllerProvider({
    int? projectId,
  }) : this._internal(
          () => ProjectFormController()..projectId = projectId,
          from: projectFormControllerProvider,
          name: r'projectFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectFormControllerHash,
          dependencies: ProjectFormControllerFamily._dependencies,
          allTransitiveDependencies:
              ProjectFormControllerFamily._allTransitiveDependencies,
          projectId: projectId,
        );

  ProjectFormControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectId,
  }) : super.internal();

  final int? projectId;

  @override
  FutureOr<ProjectFormState> runNotifierBuild(
    covariant ProjectFormController notifier,
  ) {
    return notifier.build(
      projectId: projectId,
    );
  }

  @override
  Override overrideWith(ProjectFormController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProjectFormControllerProvider._internal(
        () => create()..projectId = projectId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectId: projectId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProjectFormController,
      ProjectFormState> createElement() {
    return _ProjectFormControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectFormControllerProvider &&
        other.projectId == projectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProjectFormControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ProjectFormState> {
  /// The parameter `projectId` of this provider.
  int? get projectId;
}

class _ProjectFormControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProjectFormController,
        ProjectFormState> with ProjectFormControllerRef {
  _ProjectFormControllerProviderElement(super.provider);

  @override
  int? get projectId => (origin as ProjectFormControllerProvider).projectId;
}

String _$projectListControllerHash() =>
    r'ceb7e73caa6e789861af7404cd0aee5b9751e2a4';

/// See also [ProjectListController].
@ProviderFor(ProjectListController)
final projectListControllerProvider = AutoDisposeAsyncNotifierProvider<
    ProjectListController, ProjectListState>.internal(
  ProjectListController.new,
  name: r'projectListControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectListControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProjectListController = AutoDisposeAsyncNotifier<ProjectListState>;
String _$projectSubmitControllerHash() =>
    r'628c1b37bd03d33857c3377d364c53766ceb931f';

/// See also [ProjectSubmitController].
@ProviderFor(ProjectSubmitController)
final projectSubmitControllerProvider = AutoDisposeNotifierProvider<
    ProjectSubmitController, ProjectSubmitState>.internal(
  ProjectSubmitController.new,
  name: r'projectSubmitControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectSubmitControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProjectSubmitController = AutoDisposeNotifier<ProjectSubmitState>;
String _$scheduleFilterControllerHash() =>
    r'0035ce58bca8dbd1897d51aebd57fde84a243480';

/// See also [ScheduleFilterController].
@ProviderFor(ScheduleFilterController)
final scheduleFilterControllerProvider = AutoDisposeAsyncNotifierProvider<
    ScheduleFilterController, ScheduleFilterState>.internal(
  ScheduleFilterController.new,
  name: r'scheduleFilterControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$scheduleFilterControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ScheduleFilterController
    = AutoDisposeAsyncNotifier<ScheduleFilterState>;
String _$scheduleFormControllerHash() =>
    r'78d657ae1d1306075acf0fe582fe2ec454c39dec';

abstract class _$ScheduleFormController
    extends BuildlessAutoDisposeAsyncNotifier<ScheduleFormState> {
  late final int categoryId;
  late final int? scheduleId;

  FutureOr<ScheduleFormState> build({
    required int categoryId,
    int? scheduleId,
  });
}

/// See also [ScheduleFormController].
@ProviderFor(ScheduleFormController)
const scheduleFormControllerProvider = ScheduleFormControllerFamily();

/// See also [ScheduleFormController].
class ScheduleFormControllerFamily
    extends Family<AsyncValue<ScheduleFormState>> {
  /// See also [ScheduleFormController].
  const ScheduleFormControllerFamily();

  /// See also [ScheduleFormController].
  ScheduleFormControllerProvider call({
    required int categoryId,
    int? scheduleId,
  }) {
    return ScheduleFormControllerProvider(
      categoryId: categoryId,
      scheduleId: scheduleId,
    );
  }

  @override
  ScheduleFormControllerProvider getProviderOverride(
    covariant ScheduleFormControllerProvider provider,
  ) {
    return call(
      categoryId: provider.categoryId,
      scheduleId: provider.scheduleId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'scheduleFormControllerProvider';
}

/// See also [ScheduleFormController].
class ScheduleFormControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ScheduleFormController,
        ScheduleFormState> {
  /// See also [ScheduleFormController].
  ScheduleFormControllerProvider({
    required int categoryId,
    int? scheduleId,
  }) : this._internal(
          () => ScheduleFormController()
            ..categoryId = categoryId
            ..scheduleId = scheduleId,
          from: scheduleFormControllerProvider,
          name: r'scheduleFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$scheduleFormControllerHash,
          dependencies: ScheduleFormControllerFamily._dependencies,
          allTransitiveDependencies:
              ScheduleFormControllerFamily._allTransitiveDependencies,
          categoryId: categoryId,
          scheduleId: scheduleId,
        );

  ScheduleFormControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
    required this.scheduleId,
  }) : super.internal();

  final int categoryId;
  final int? scheduleId;

  @override
  FutureOr<ScheduleFormState> runNotifierBuild(
    covariant ScheduleFormController notifier,
  ) {
    return notifier.build(
      categoryId: categoryId,
      scheduleId: scheduleId,
    );
  }

  @override
  Override overrideWith(ScheduleFormController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ScheduleFormControllerProvider._internal(
        () => create()
          ..categoryId = categoryId
          ..scheduleId = scheduleId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
        scheduleId: scheduleId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ScheduleFormController,
      ScheduleFormState> createElement() {
    return _ScheduleFormControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ScheduleFormControllerProvider &&
        other.categoryId == categoryId &&
        other.scheduleId == scheduleId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);
    hash = _SystemHash.combine(hash, scheduleId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ScheduleFormControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ScheduleFormState> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;

  /// The parameter `scheduleId` of this provider.
  int? get scheduleId;
}

class _ScheduleFormControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ScheduleFormController,
        ScheduleFormState> with ScheduleFormControllerRef {
  _ScheduleFormControllerProviderElement(super.provider);

  @override
  int get categoryId => (origin as ScheduleFormControllerProvider).categoryId;
  @override
  int? get scheduleId => (origin as ScheduleFormControllerProvider).scheduleId;
}

String _$scheduleListControllerHash() =>
    r'542a01fdde2b1f380118d180c07a0fe571588bf8';

abstract class _$ScheduleListController
    extends BuildlessAutoDisposeAsyncNotifier<ScheduleListState> {
  late final int projectId;

  FutureOr<ScheduleListState> build({
    required int projectId,
  });
}

/// See also [ScheduleListController].
@ProviderFor(ScheduleListController)
const scheduleListControllerProvider = ScheduleListControllerFamily();

/// See also [ScheduleListController].
class ScheduleListControllerFamily
    extends Family<AsyncValue<ScheduleListState>> {
  /// See also [ScheduleListController].
  const ScheduleListControllerFamily();

  /// See also [ScheduleListController].
  ScheduleListControllerProvider call({
    required int projectId,
  }) {
    return ScheduleListControllerProvider(
      projectId: projectId,
    );
  }

  @override
  ScheduleListControllerProvider getProviderOverride(
    covariant ScheduleListControllerProvider provider,
  ) {
    return call(
      projectId: provider.projectId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'scheduleListControllerProvider';
}

/// See also [ScheduleListController].
class ScheduleListControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ScheduleListController,
        ScheduleListState> {
  /// See also [ScheduleListController].
  ScheduleListControllerProvider({
    required int projectId,
  }) : this._internal(
          () => ScheduleListController()..projectId = projectId,
          from: scheduleListControllerProvider,
          name: r'scheduleListControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$scheduleListControllerHash,
          dependencies: ScheduleListControllerFamily._dependencies,
          allTransitiveDependencies:
              ScheduleListControllerFamily._allTransitiveDependencies,
          projectId: projectId,
        );

  ScheduleListControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectId,
  }) : super.internal();

  final int projectId;

  @override
  FutureOr<ScheduleListState> runNotifierBuild(
    covariant ScheduleListController notifier,
  ) {
    return notifier.build(
      projectId: projectId,
    );
  }

  @override
  Override overrideWith(ScheduleListController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ScheduleListControllerProvider._internal(
        () => create()..projectId = projectId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectId: projectId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ScheduleListController,
      ScheduleListState> createElement() {
    return _ScheduleListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ScheduleListControllerProvider &&
        other.projectId == projectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ScheduleListControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ScheduleListState> {
  /// The parameter `projectId` of this provider.
  int get projectId;
}

class _ScheduleListControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ScheduleListController,
        ScheduleListState> with ScheduleListControllerRef {
  _ScheduleListControllerProviderElement(super.provider);

  @override
  int get projectId => (origin as ScheduleListControllerProvider).projectId;
}

String _$scheduleSubmitControllerHash() =>
    r'667980ae54181b143123f814ea25a5fb0d5a103a';

/// See also [ScheduleSubmitController].
@ProviderFor(ScheduleSubmitController)
final scheduleSubmitControllerProvider = AutoDisposeNotifierProvider<
    ScheduleSubmitController, ScheduleSubmitState>.internal(
  ScheduleSubmitController.new,
  name: r'scheduleSubmitControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$scheduleSubmitControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ScheduleSubmitController = AutoDisposeNotifier<ScheduleSubmitState>;
String _$supplierSearchControllerHash() =>
    r'312b3883addff0121c4c865d7de98dc5f89152df';

/// See also [SupplierSearchController].
@ProviderFor(SupplierSearchController)
final supplierSearchControllerProvider = AutoDisposeNotifierProvider<
    SupplierSearchController, SupplierSearchState>.internal(
  SupplierSearchController.new,
  name: r'supplierSearchControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supplierSearchControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SupplierSearchController = AutoDisposeNotifier<SupplierSearchState>;
String _$tripFilterControllerHash() =>
    r'33d8c8a8097ba01d1a001e5c70d64435792d99e8';

abstract class _$TripFilterController
    extends BuildlessAutoDisposeAsyncNotifier<TripFilterState> {
  late final int? categoryId;

  FutureOr<TripFilterState> build({
    int? categoryId,
  });
}

/// See also [TripFilterController].
@ProviderFor(TripFilterController)
const tripFilterControllerProvider = TripFilterControllerFamily();

/// See also [TripFilterController].
class TripFilterControllerFamily extends Family<AsyncValue<TripFilterState>> {
  /// See also [TripFilterController].
  const TripFilterControllerFamily();

  /// See also [TripFilterController].
  TripFilterControllerProvider call({
    int? categoryId,
  }) {
    return TripFilterControllerProvider(
      categoryId: categoryId,
    );
  }

  @override
  TripFilterControllerProvider getProviderOverride(
    covariant TripFilterControllerProvider provider,
  ) {
    return call(
      categoryId: provider.categoryId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'tripFilterControllerProvider';
}

/// See also [TripFilterController].
class TripFilterControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    TripFilterController, TripFilterState> {
  /// See also [TripFilterController].
  TripFilterControllerProvider({
    int? categoryId,
  }) : this._internal(
          () => TripFilterController()..categoryId = categoryId,
          from: tripFilterControllerProvider,
          name: r'tripFilterControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tripFilterControllerHash,
          dependencies: TripFilterControllerFamily._dependencies,
          allTransitiveDependencies:
              TripFilterControllerFamily._allTransitiveDependencies,
          categoryId: categoryId,
        );

  TripFilterControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
  }) : super.internal();

  final int? categoryId;

  @override
  FutureOr<TripFilterState> runNotifierBuild(
    covariant TripFilterController notifier,
  ) {
    return notifier.build(
      categoryId: categoryId,
    );
  }

  @override
  Override overrideWith(TripFilterController Function() create) {
    return ProviderOverride(
      origin: this,
      override: TripFilterControllerProvider._internal(
        () => create()..categoryId = categoryId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TripFilterController, TripFilterState>
      createElement() {
    return _TripFilterControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TripFilterControllerProvider &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TripFilterControllerRef
    on AutoDisposeAsyncNotifierProviderRef<TripFilterState> {
  /// The parameter `categoryId` of this provider.
  int? get categoryId;
}

class _TripFilterControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TripFilterController,
        TripFilterState> with TripFilterControllerRef {
  _TripFilterControllerProviderElement(super.provider);

  @override
  int? get categoryId => (origin as TripFilterControllerProvider).categoryId;
}

String _$tripFormControllerHash() =>
    r'093d616e18ad75b8d64fb089fd2cff3b98eb4c50';

abstract class _$TripFormController
    extends BuildlessAutoDisposeAsyncNotifier<TripFormState> {
  late final int projectId;
  late final int? tripId;

  FutureOr<TripFormState> build({
    required int projectId,
    int? tripId,
  });
}

/// See also [TripFormController].
@ProviderFor(TripFormController)
const tripFormControllerProvider = TripFormControllerFamily();

/// See also [TripFormController].
class TripFormControllerFamily extends Family<AsyncValue<TripFormState>> {
  /// See also [TripFormController].
  const TripFormControllerFamily();

  /// See also [TripFormController].
  TripFormControllerProvider call({
    required int projectId,
    int? tripId,
  }) {
    return TripFormControllerProvider(
      projectId: projectId,
      tripId: tripId,
    );
  }

  @override
  TripFormControllerProvider getProviderOverride(
    covariant TripFormControllerProvider provider,
  ) {
    return call(
      projectId: provider.projectId,
      tripId: provider.tripId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'tripFormControllerProvider';
}

/// See also [TripFormController].
class TripFormControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    TripFormController, TripFormState> {
  /// See also [TripFormController].
  TripFormControllerProvider({
    required int projectId,
    int? tripId,
  }) : this._internal(
          () => TripFormController()
            ..projectId = projectId
            ..tripId = tripId,
          from: tripFormControllerProvider,
          name: r'tripFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tripFormControllerHash,
          dependencies: TripFormControllerFamily._dependencies,
          allTransitiveDependencies:
              TripFormControllerFamily._allTransitiveDependencies,
          projectId: projectId,
          tripId: tripId,
        );

  TripFormControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectId,
    required this.tripId,
  }) : super.internal();

  final int projectId;
  final int? tripId;

  @override
  FutureOr<TripFormState> runNotifierBuild(
    covariant TripFormController notifier,
  ) {
    return notifier.build(
      projectId: projectId,
      tripId: tripId,
    );
  }

  @override
  Override overrideWith(TripFormController Function() create) {
    return ProviderOverride(
      origin: this,
      override: TripFormControllerProvider._internal(
        () => create()
          ..projectId = projectId
          ..tripId = tripId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectId: projectId,
        tripId: tripId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TripFormController, TripFormState>
      createElement() {
    return _TripFormControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TripFormControllerProvider &&
        other.projectId == projectId &&
        other.tripId == tripId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);
    hash = _SystemHash.combine(hash, tripId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TripFormControllerRef
    on AutoDisposeAsyncNotifierProviderRef<TripFormState> {
  /// The parameter `projectId` of this provider.
  int get projectId;

  /// The parameter `tripId` of this provider.
  int? get tripId;
}

class _TripFormControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TripFormController,
        TripFormState> with TripFormControllerRef {
  _TripFormControllerProviderElement(super.provider);

  @override
  int get projectId => (origin as TripFormControllerProvider).projectId;
  @override
  int? get tripId => (origin as TripFormControllerProvider).tripId;
}

String _$tripListControllerHash() =>
    r'e2fdb12f51baa49694a63b878a236ffa5b53385b';

abstract class _$TripListController
    extends BuildlessAutoDisposeAsyncNotifier<TripListState> {
  late final int projectId;

  FutureOr<TripListState> build({
    required int projectId,
  });
}

/// See also [TripListController].
@ProviderFor(TripListController)
const tripListControllerProvider = TripListControllerFamily();

/// See also [TripListController].
class TripListControllerFamily extends Family<AsyncValue<TripListState>> {
  /// See also [TripListController].
  const TripListControllerFamily();

  /// See also [TripListController].
  TripListControllerProvider call({
    required int projectId,
  }) {
    return TripListControllerProvider(
      projectId: projectId,
    );
  }

  @override
  TripListControllerProvider getProviderOverride(
    covariant TripListControllerProvider provider,
  ) {
    return call(
      projectId: provider.projectId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'tripListControllerProvider';
}

/// See also [TripListController].
class TripListControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    TripListController, TripListState> {
  /// See also [TripListController].
  TripListControllerProvider({
    required int projectId,
  }) : this._internal(
          () => TripListController()..projectId = projectId,
          from: tripListControllerProvider,
          name: r'tripListControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tripListControllerHash,
          dependencies: TripListControllerFamily._dependencies,
          allTransitiveDependencies:
              TripListControllerFamily._allTransitiveDependencies,
          projectId: projectId,
        );

  TripListControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectId,
  }) : super.internal();

  final int projectId;

  @override
  FutureOr<TripListState> runNotifierBuild(
    covariant TripListController notifier,
  ) {
    return notifier.build(
      projectId: projectId,
    );
  }

  @override
  Override overrideWith(TripListController Function() create) {
    return ProviderOverride(
      origin: this,
      override: TripListControllerProvider._internal(
        () => create()..projectId = projectId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectId: projectId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TripListController, TripListState>
      createElement() {
    return _TripListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TripListControllerProvider && other.projectId == projectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TripListControllerRef
    on AutoDisposeAsyncNotifierProviderRef<TripListState> {
  /// The parameter `projectId` of this provider.
  int get projectId;
}

class _TripListControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TripListController,
        TripListState> with TripListControllerRef {
  _TripListControllerProviderElement(super.provider);

  @override
  int get projectId => (origin as TripListControllerProvider).projectId;
}

String _$tripStepControllerHash() =>
    r'876d0392e32a7ac37aa8cd3c1bb905c8de85f69f';

/// See also [TripStepController].
@ProviderFor(TripStepController)
final tripStepControllerProvider =
    AutoDisposeNotifierProvider<TripStepController, TripStepState>.internal(
  TripStepController.new,
  name: r'tripStepControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tripStepControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TripStepController = AutoDisposeNotifier<TripStepState>;
String _$tripSubmitControllerHash() =>
    r'10c3448f2feae128f7891476fed8ae411098d6f2';

/// See also [TripSubmitController].
@ProviderFor(TripSubmitController)
final tripSubmitControllerProvider =
    AutoDisposeNotifierProvider<TripSubmitController, TripSubmitState>.internal(
  TripSubmitController.new,
  name: r'tripSubmitControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tripSubmitControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TripSubmitController = AutoDisposeNotifier<TripSubmitState>;
String _$userFilterControllerHash() =>
    r'14df2dbc4e5b45aa54361a8b4bc72b5b44f4337f';

/// See also [UserFilterController].
@ProviderFor(UserFilterController)
final userFilterControllerProvider = AutoDisposeAsyncNotifierProvider<
    UserFilterController, UserFilterState>.internal(
  UserFilterController.new,
  name: r'userFilterControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userFilterControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserFilterController = AutoDisposeAsyncNotifier<UserFilterState>;
String _$userListControllerHash() =>
    r'a4c449cf8f3f2876c5f77d83f6097c42acfaa6a0';

/// See also [UserListController].
@ProviderFor(UserListController)
final userListControllerProvider = AutoDisposeAsyncNotifierProvider<
    UserListController, UserListState>.internal(
  UserListController.new,
  name: r'userListControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userListControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserListController = AutoDisposeAsyncNotifier<UserListState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
