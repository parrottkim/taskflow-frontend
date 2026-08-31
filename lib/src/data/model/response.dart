part of '../data.dart';

@Freezed(genericArgumentFactories: true)
abstract class Result<T> with _$Result<T> {
  const Result._();
  const factory Result({
    @Default([]) List<T> items,
    @Default(0) int page,
    @Default(0) int total,
    @Default(false) bool hasNext,
    @Default(false) bool hasPrevious,
  }) = _Result;

  factory Result.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    final parsedItems = <T>[];
    final rawItems = json['items'];

    if (rawItems is List) {
      for (final raw in rawItems) {
        parsedItems.add(fromJsonT(raw));
      }
    }

    return Result<T>(
      items: parsedItems,
      page: (json['page'] as num?)?.toInt() ?? 0,
      total: (json['total'] as num?)?.toInt() ?? 0,
      hasNext: json['hasNext'] as bool? ?? false,
      hasPrevious: json['hasPrevious'] as bool? ?? false,
    );
  }
}

@freezed
abstract class UploadedFile with _$UploadedFile {
  factory UploadedFile({required String path, required String url}) =
      _UploadedFile;

  factory UploadedFile.fromJson(Map<String, dynamic> json) =>
      _$UploadedFileFromJson(json);
}
