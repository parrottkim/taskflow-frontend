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
  ) => _$ResultFromJson(json, fromJsonT);
}

enum ImageExtension {
  png(format: Formats.png, mime: ['image/png']),
  jpg(format: Formats.jpeg, mime: ['image/jpeg', 'image/jpg']),
  gif(format: Formats.gif, mime: ['image/gif']),
  webp(format: Formats.webp, mime: ['image/webp']);

  final SimpleFileFormat format;
  final List<String> mime;

  const ImageExtension({required this.format, required this.mime});

  factory ImageExtension.getExtension(String type) {
    return ImageExtension.values.firstWhere((e) => e.mime.contains(type));
  }
}

@freezed
abstract class File with _$File {
  factory File({required String path, required String url}) = _File;

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);
}
