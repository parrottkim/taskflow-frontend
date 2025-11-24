part of '../provider.dart';

@riverpod
String serviceUrl(Ref ref) {
  const environment = String.fromEnvironment('ENVIRONMENT');

  if (environment == 'local') return 'http://localhost:3000/';

  final hostname = 'taskflow.dan-tech.com';
  final url = environment == 'dev'
      ? 'https://dev.$hostname/api/'
      : 'https://$hostname/api/';

  return url;
}

@riverpod
String clientUrl(Ref ref) {
  const environment = String.fromEnvironment('ENVIRONMENT');

  if (environment == 'local') return 'http://localhost:8000/';

  final hostname = 'taskflow.dan-tech.com';
  final url =
      environment == 'dev' ? 'https://dev.$hostname/' : 'https://$hostname/';

  return url;
}
