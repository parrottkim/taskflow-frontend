// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'037eda4f7b3492c67909e36a269383429e6bc18a';

/// See also [router].
@ProviderFor(router)
final routerProvider = AutoDisposeProvider<AppRouter>.internal(
  router,
  name: r'routerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RouterRef = AutoDisposeProviderRef<AppRouter>;
String _$routerInterceptorHash() => r'11ef0ae8b045f81c8a18336579ee1dbaa4149295';

/// 라우터 인터셉터를 생성하는 함수
///
/// Copied from [routerInterceptor].
@ProviderFor(routerInterceptor)
final routerInterceptorProvider =
    AutoDisposeProvider<RouterInterceptor>.internal(
  routerInterceptor,
  name: r'routerInterceptorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$routerInterceptorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RouterInterceptorRef = AutoDisposeProviderRef<RouterInterceptor>;
String _$routerNotifierHash() => r'e68436a6f67204c4fa1928148cb5c04b4e921268';

/// See also [RouterNotifier].
@ProviderFor(RouterNotifier)
final routerNotifierProvider =
    AutoDisposeAsyncNotifierProvider<RouterNotifier, void>.internal(
  RouterNotifier.new,
  name: r'routerNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$routerNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RouterNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
