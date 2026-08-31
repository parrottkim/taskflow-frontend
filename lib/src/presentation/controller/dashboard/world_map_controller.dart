part of '../controller.dart';

@riverpod
Future<List<ClientCount>> worldMap(Ref ref) {
  return ref.watch(projectClientRepositoryProvider).getAllClientCount();
}
