// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(serviceUrl)
final serviceUrlProvider = ServiceUrlProvider._();

final class ServiceUrlProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  ServiceUrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serviceUrlProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serviceUrlHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return serviceUrl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$serviceUrlHash() => r'515e0ab94f472eeabbd5ce9cfb53d58c0a3446bf';

@ProviderFor(clientUrl)
final clientUrlProvider = ClientUrlProvider._();

final class ClientUrlProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  ClientUrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clientUrlProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clientUrlHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return clientUrl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$clientUrlHash() => r'46e2a4023f87e37ec7d80bf30d2203819fc4983e';

@ProviderFor(flutterSecureStorage)
final flutterSecureStorageProvider = FlutterSecureStorageProvider._();

final class FlutterSecureStorageProvider
    extends
        $FunctionalProvider<
          FlutterSecureStorage,
          FlutterSecureStorage,
          FlutterSecureStorage
        >
    with $Provider<FlutterSecureStorage> {
  FlutterSecureStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'flutterSecureStorageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$flutterSecureStorageHash();

  @$internal
  @override
  $ProviderElement<FlutterSecureStorage> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FlutterSecureStorage create(Ref ref) {
    return flutterSecureStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlutterSecureStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlutterSecureStorage>(value),
    );
  }
}

String _$flutterSecureStorageHash() =>
    r'b785c9732d44fba14a0c5b728f3026c023c7e443';

@ProviderFor(http)
final httpProvider = HttpProvider._();

final class HttpProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  HttpProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'httpProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$httpHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return http(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$httpHash() => r'3486bfc0d50f2b23b495ae21a6d6db5958d60575';

@ProviderFor(sharedPreferencesAsync)
final sharedPreferencesAsyncProvider = SharedPreferencesAsyncProvider._();

final class SharedPreferencesAsyncProvider
    extends
        $FunctionalProvider<
          SharedPreferencesAsync,
          SharedPreferencesAsync,
          SharedPreferencesAsync
        >
    with $Provider<SharedPreferencesAsync> {
  SharedPreferencesAsyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesAsyncProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesAsyncHash();

  @$internal
  @override
  $ProviderElement<SharedPreferencesAsync> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferencesAsync create(Ref ref) {
    return sharedPreferencesAsync(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferencesAsync value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferencesAsync>(value),
    );
  }
}

String _$sharedPreferencesAsyncHash() =>
    r'7238cef891f7ca9e5b895af232d8b932f1fc9282';

@ProviderFor(toast)
final toastProvider = ToastProvider._();

final class ToastProvider extends $FunctionalProvider<FToast, FToast, FToast>
    with $Provider<FToast> {
  ToastProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toastProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toastHash();

  @$internal
  @override
  $ProviderElement<FToast> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FToast create(Ref ref) {
    return toast(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FToast value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FToast>(value),
    );
  }
}

String _$toastHash() => r'c6e4bbbe521e726a0f97aa9358213da9a667d726';
