// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RouterListenableNotifier)
final routerListenableProvider = RouterListenableNotifierProvider._();

final class RouterListenableNotifierProvider
    extends $AsyncNotifierProvider<RouterListenableNotifier, void> {
  RouterListenableNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routerListenableProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routerListenableNotifierHash();

  @$internal
  @override
  RouterListenableNotifier create() => RouterListenableNotifier();
}

String _$routerListenableNotifierHash() =>
    r'195247aff7f0ad11605d1e838dcac05156915ee0';

abstract class _$RouterListenableNotifier extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(router)
final routerProvider = RouterProvider._();

final class RouterProvider
    extends $FunctionalProvider<AppRouter, AppRouter, AppRouter>
    with $Provider<AppRouter> {
  RouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routerHash();

  @$internal
  @override
  $ProviderElement<AppRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppRouter create(Ref ref) {
    return router(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppRouter>(value),
    );
  }
}

String _$routerHash() => r'c8586a5331c88eb5e9a46f43e0035cb13a066d44';

/// 라우터 인터셉터를 생성하는 함수

@ProviderFor(routerInterceptor)
final routerInterceptorProvider = RouterInterceptorProvider._();

/// 라우터 인터셉터를 생성하는 함수

final class RouterInterceptorProvider
    extends
        $FunctionalProvider<
          RouterInterceptor,
          RouterInterceptor,
          RouterInterceptor
        >
    with $Provider<RouterInterceptor> {
  /// 라우터 인터셉터를 생성하는 함수
  RouterInterceptorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routerInterceptorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routerInterceptorHash();

  @$internal
  @override
  $ProviderElement<RouterInterceptor> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RouterInterceptor create(Ref ref) {
    return routerInterceptor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RouterInterceptor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RouterInterceptor>(value),
    );
  }
}

String _$routerInterceptorHash() => r'11ef0ae8b045f81c8a18336579ee1dbaa4149295';
