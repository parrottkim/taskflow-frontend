part of '../controller.dart';

@riverpod
Future<TripOptionsState> tripOptions(Ref ref, {int? categoryId}) async {
  final categories = await ref
      .read(reportRepositoryProvider)
      .getAllTripCategories();
  final steps = categoryId != null
      ? await ref.read(reportRepositoryProvider).getAllTripSteps(id: categoryId)
      : <TripStep>[];
  final currencies = await ref
      .read(currencyRepositoryProvider)
      .getAllCurrencies();
  if (currencies.isEmpty) {
    throw StateError('사용 가능한 통화가 없습니다.');
  }
  final regulations = categoryId != null
      ? await ref
            .read(reportRepositoryProvider)
            .getAllTripRegulations(id: categoryId)
      : <TripRegulation>[];

  return TripOptionsState(
    categories: categories,
    steps: steps,
    currencies: currencies,
    regulations: regulations,
  );
}
