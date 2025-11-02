import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:taskflow/src/data/data.dart';

class BufferConverter
    implements JsonConverter<Uint8List, Map<String, dynamic>> {
  const BufferConverter();

  @override
  Uint8List fromJson(Map<String, dynamic> json) {
    return Uint8List.fromList(List<int>.from(json['data']));
  }

  @override
  Map<String, dynamic> toJson(Uint8List object) {
    return {
      'type': 'Buffer',
      'data': object.toList(),
    };
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
          0); // Return an empty Uint8List if the structure doesn't match
    }).toList();
  }

  @override
  List<dynamic> toJson(List<Uint8List> object) {
    return object.map((buffer) {
      return {
        'type': 'Buffer',
        'data': buffer.toList(),
      };
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

class IssueDetailsConverter
    implements JsonConverter<IssueDetails, Map<String, dynamic>> {
  const IssueDetailsConverter();

  @override
  IssueDetails fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String;
    final data = json['data'] as Map<String, dynamic>;

    switch (type) {
      case 'contract':
        return IssueContractDetails.fromJson(data);
      case 'kickoff':
        return IssueKickoffDetails.fromJson(data);
      case 'approval':
        return ApprovalDetails.fromJson(data);
      case 'procurement':
        return IssueProcurementDetails.fromJson(data);
      case 'transaction':
        return IssueTransactionDetails.fromJson(data);
      case 'declaration':
        return IssueDeclarationDetails.fromJson(data);
      case 'payment':
        return IssuePaymentDetails.fromJson(data);
      default:
        throw ArgumentError('Unknown IssueDetails type: $type');
    }
  }

  @override
  Map<String, dynamic> toJson(IssueDetails details) => details.toJson();
}
