part of '../controller.dart';

@riverpod
Future<List<TodaySchedule>> calendar(Ref ref) async {
  final result = await ref
      .watch(dashboardRepositoryProvider)
      .getTodaysSchedule();
  return [...result]..sort((a, b) => a.category.id.compareTo(b.category.id));
}
