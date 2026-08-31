part of '../widget.dart';

enum ClientBrand {
  hyundai(
    id: 1,
    asset: 'assets/icons/hyundai.svg',
    color: 0xFF003984,
    labelKey: 'hyundai',
  ),
  kia(
    id: 39,
    asset: 'assets/icons/kia.svg',
    color: 0xFF05141F,
    labelKey: 'kia',
  ),
  labAndOther(
    id: 64,
    asset: 'assets/icons/manufacturing.svg',
    color: 0xFF78909C,
    labelKey: 'lab_and_other',
  );

  final int id;
  final String asset;
  final int color;
  final String labelKey;

  const ClientBrand({
    required this.id,
    required this.asset,
    required this.color,
    required this.labelKey,
  });

  String get label => Intl.message(labelKey);

  factory ClientBrand.fromKey(int id) {
    return ClientBrand.values.firstWhere(
      (client) => client.id == id,
      orElse: () => ClientBrand.hyundai,
    );
  }
}
