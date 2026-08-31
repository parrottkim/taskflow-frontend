import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

class BufferConverter
    implements JsonConverter<Uint8List, Map<String, dynamic>> {
  const BufferConverter();

  @override
  Uint8List fromJson(Map<String, dynamic> json) {
    return Uint8List.fromList(List<int>.from(json['data']));
  }

  @override
  Map<String, dynamic> toJson(Uint8List object) {
    return {'type': 'Buffer', 'data': object.toList()};
  }
}

class BufferListConverter
    implements JsonConverter<List<Uint8List>, List<dynamic>> {
  const BufferListConverter();

  @override
  List<Uint8List> fromJson(List<dynamic> json) {
    return json.map((item) {
      if (item is Map<String, dynamic> &&
          item['type'] == 'Buffer' &&
          item['data'] is List) {
        return Uint8List.fromList(List<int>.from(item['data']));
      }
      return Uint8List(
        0,
      ); // Return an empty Uint8List if the structure doesn't match
    }).toList();
  }

  @override
  List<dynamic> toJson(List<Uint8List> object) {
    return object.map((buffer) {
      return {'type': 'Buffer', 'data': buffer.toList()};
    }).toList();
  }
}

class DateTimeConverter implements JsonConverter<DateTime, String> {
  final String? format;

  const DateTimeConverter({this.format});

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => DateFormat(format).format(object);
}
