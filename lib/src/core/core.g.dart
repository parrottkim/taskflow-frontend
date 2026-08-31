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

String _$serviceUrlHash() => r'a2c3e087520fdf16d3406e6fdde9499ffb53e6a1';

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

String _$clientUrlHash() => r'5e9b346d13d04a5ef079c1fbad13b480c215416f';

@ProviderFor(indexedDatabase)
final indexedDatabaseProvider = IndexedDatabaseProvider._();

final class IndexedDatabaseProvider
    extends $FunctionalProvider<Database, Database, Database>
    with $Provider<Database> {
  IndexedDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'indexedDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$indexedDatabaseHash();

  @$internal
  @override
  $ProviderElement<Database> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Database create(Ref ref) {
    return indexedDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Database value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Database>(value),
    );
  }
}

String _$indexedDatabaseHash() => r'b5dc0dc2e6569b564159e700d9b5eedf653743fb';

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

String _$httpHash() => r'a9e43df86fd3ff7097764d6fe24cdba724841bae';

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
