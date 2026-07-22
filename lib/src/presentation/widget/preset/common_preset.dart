part of '../widget.dart';

enum ClientType {
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

  const ClientType({
    required this.id,
    required this.asset,
    required this.color,
    required this.labelKey,
  });

  String get label => Intl.message(labelKey);

  factory ClientType.fromKey(int id) {
    return ClientType.values.firstWhere(
      (order) => order.id == id,
      orElse: () => ClientType.hyundai,
    );
  }
}

enum Order {
  asc('asc', Symbols.arrow_drop_up_rounded, 'filter_ascending'),
  desc('desc', Symbols.arrow_drop_down_rounded, 'filter_descending');

  final String key;
  final IconData icon;
  final String labelKey;

  const Order(this.key, this.icon, this.labelKey);

  String get label => Intl.message(labelKey);

  factory Order.fromKey(String key) {
    return Order.values.firstWhere(
      (order) => order.key == key,
      orElse: () => Order.asc,
    );
  }

  Order get toggled => this == Order.asc ? Order.desc : Order.asc;
}
