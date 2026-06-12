part of 'widget.dart';

class WidgetPreset {
  final BuildContext context;

  WidgetPreset(this.context);

  List<ValidationItem> get passwordValidationItems => [
    ValidationItem(
      label: Intl.message('register_password_validation_1'),
      regex: RegExp(r'^.{8,}$'),
      flag: false,
    ),
    ValidationItem(
      label: Intl.message('register_password_validation_2'),
      regex: RegExp(r'[A-Z]'),
      flag: false,
    ),
    ValidationItem(
      label: Intl.message('register_password_validation_3'),
      regex: RegExp(r'[a-z]'),
      flag: false,
    ),
    ValidationItem(
      label: Intl.message('register_password_validation_4'),
      regex: RegExp(r'[0-9]'),
      flag: false,
    ),
    ValidationItem(
      label: Intl.message('register_password_validation_5'),
      regex: RegExp(r'[!@#\$%^&*(),.?":{}|<>]'),
      flag: false,
    ),
  ];

  List<NavigationItem> get navigationItems => [
    NavigationButton(
      icon: Symbols.space_dashboard_rounded,
      route: RouteNames.dashboard,
      label: Intl.message('dashboard'),
    ),
    NavigationTitle(label: Intl.message('navigation_title_1')),
    NavigationButton(
      icon: Symbols.work_rounded,
      route: RouteNames.project,
      label: Intl.message('project'),
    ),
    NavigationButton(
      icon: Symbols.laptop_windows_rounded,
      route: RouteNames.work,
      label: Intl.message('work'),
    ),
    NavigationButton(
      icon: Symbols.newsstand_rounded,
      route: RouteNames.document,
      label: Intl.message('document'),
    ),
    NavigationTitle(label: Intl.message('navigation_title_2'), isAdmin: true),
    NavigationButton(
      icon: Symbols.data_table_rounded,
      route: RouteNames.data,
      label: Intl.message('data'),
      isAdmin: true,
    ),
    NavigationButton(
      icon: Symbols.finance_rounded,
      route: RouteNames.analytics,
      label: Intl.message('analytics'),
      isAdmin: true,
    ),
    // NavigationTitle(label: Intl.message('navigation_title_3')),
  ];

  List<ClientCount> get dummyClientCount => [
    ClientCount(depth: 0, count: 30),
    ClientCount(depth: 1, count: 50),
    ClientCount(depth: 2, count: 80),
  ];

  List<ClientMarker> get markers => [
    ClientMarker(
      latitude: 32.7034579,
      longitude: -85.1227099,
      items: [
        ClientMarkerTooltip(type: ClientType.hyundai, name: 'HMMA'),
        ClientMarkerTooltip(type: ClientType.hyundai, name: 'HMGMA'),
        ClientMarkerTooltip(type: ClientType.kia, name: 'KaGA'),
      ],
    ),
    ClientMarker(
      latitude: 25.7416901,
      longitude: -99.9848248,
      items: [ClientMarkerTooltip(type: ClientType.kia, name: 'KMMX')],
    ),
    ClientMarker(
      latitude: -22.6949213,
      longitude: -47.604286,
      items: [ClientMarkerTooltip(type: ClientType.hyundai, name: 'HMB')],
    ),
    ClientMarker(
      latitude: 49.6618149,
      longitude: 18.4424672,
      items: [
        ClientMarkerTooltip(type: ClientType.hyundai, name: 'HMMC'),
        ClientMarkerTooltip(type: ClientType.kia, name: 'KaSK (KMS)'),
      ],
    ),
    ClientMarker(
      latitude: 40.771757,
      longitude: 30.0218881,
      items: [ClientMarkerTooltip(type: ClientType.hyundai, name: 'HAOS')],
    ),
    ClientMarker(
      latitude: 21,
      longitude: 78,
      items: [
        ClientMarkerTooltip(type: ClientType.hyundai, name: 'HMI'),
        ClientMarkerTooltip(type: ClientType.kia, name: 'KIN (KMI)'),
      ],
    ),
    ClientMarker(
      latitude: 40.1083135,
      longitude: 116.6547006,
      items: [ClientMarkerTooltip(type: ClientType.hyundai, name: 'BHMC')],
    ),
    ClientMarker(
      latitude: 33.3641129,
      longitude: 120.2129256,
      items: [ClientMarkerTooltip(type: ClientType.kia, name: 'DYKMC')],
    ),
    ClientMarker(
      latitude: 1.3528215,
      longitude: 103.709285,
      items: [ClientMarkerTooltip(type: ClientType.hyundai, name: 'HMGICs')],
    ),
    ClientMarker(
      latitude: -6.4040317,
      longitude: 107.1848675,
      items: [ClientMarkerTooltip(type: ClientType.hyundai, name: 'HMMI')],
    ),
    ClientMarker(
      latitude: 37,
      longitude: 127.5,
      items: [
        ClientMarkerTooltip(type: ClientType.hyundai, name: '아산'),
        ClientMarkerTooltip(type: ClientType.hyundai, name: '울산'),
        ClientMarkerTooltip(type: ClientType.hyundai, name: '전주'),
        ClientMarkerTooltip(type: ClientType.kia, name: '광명'),
        ClientMarkerTooltip(type: ClientType.kia, name: '화성'),
        ClientMarkerTooltip(type: ClientType.kia, name: '광주'),
        ClientMarkerTooltip(type: ClientType.labAndOther, name: '남양 연구소'),
        ClientMarkerTooltip(type: ClientType.labAndOther, name: '의왕 연구소'),
        ClientMarkerTooltip(type: ClientType.labAndOther, name: '서산 동희오토'),
        ClientMarkerTooltip(type: ClientType.labAndOther, name: '광주 GGM'),
      ],
    ),
  ];

  List<MenuOption> get quickMenu => [
    MenuOption(
      icon: Symbols.today_rounded,
      label: Intl.message('dashboard_functions_1'),
      onPressed: () {
        context.pushNamed(RouteNames.scheduleNewChoose);
      },
    ),
    MenuOption(
      icon: Symbols.description_rounded,
      label: Intl.message('dashboard_functions_2'),
      onPressed: () {
        context.pushNamed(RouteNames.projectNew);
      },
    ),
  ];

  List<MenuOption> get workMenu => [
    MenuOption(
      icon: Symbols.today_rounded,
      label: Intl.message('work_1'),
      description: Intl.message('work_1_1'),
      onPressed: () {},
    ),
    MenuOption(
      icon: Symbols.beach_access_rounded,
      label: Intl.message('work_2'),
      description: Intl.message('work_2_1'),
      onPressed: null,
    ),
    MenuOption(
      icon: Symbols.summarize_rounded,
      label: Intl.message('work_3'),
      description: Intl.message('work_3_1'),
      onPressed: null,
    ),
  ];
}

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

enum ProjectSegment {
  all('project_segment_1'),
  preexecuted('project_segment_2'),
  active('project_segment_3'),
  closed('project_segment_4');

  final String labelKey;

  const ProjectSegment(this.labelKey);

  String get label => Intl.message(labelKey);

  factory ProjectSegment.fromKey(String key) => ProjectSegment.values
      .firstWhere((e) => e.name == key, orElse: () => ProjectSegment.all);
}

enum ProjectSort {
  updated('updated', 'project_sort_1'),
  created('created', 'project_sort_2'),
  code('code', 'project_sort_3'),
  name('name', 'project_sort_4');

  final String key;
  final String labelKey;

  const ProjectSort(this.key, this.labelKey);

  String get label => Intl.message(labelKey);

  factory ProjectSort.fromKey(String key) => ProjectSort.values.firstWhere(
    (e) => e.key == key,
    orElse: () => ProjectSort.updated,
  );
}

enum ProjectDetailSegment {
  contract('project_detail_segment_1'),
  approval('project_detail_segment_2'),
  procurement('project_detail_segment_3'),
  report('project_detail_segment_4'),
  timeline('project_detail_segment_5');

  final String labelKey;

  const ProjectDetailSegment(this.labelKey);

  String get label => Intl.message(labelKey);

  factory ProjectDetailSegment.fromKey(String key) =>
      ProjectDetailSegment.values.firstWhere(
        (e) => e.name == key,
        orElse: () => ProjectDetailSegment.contract,
      );
}

enum WorkSegment {
  schedule('work_segment_1'),
  weekly('work_segment_2');

  final String labelKey;

  const WorkSegment(this.labelKey);

  String get label => Intl.message(labelKey);

  factory WorkSegment.fromKey(String key) => WorkSegment.values.firstWhere(
    (e) => e.name == key,
    orElse: () => WorkSegment.schedule,
  );
}

enum DataSegment {
  user('data_segment_1'),
  supplier('data_segment_2');

  final String labelKey;

  const DataSegment(this.labelKey);

  String get label => Intl.message(labelKey);

  factory DataSegment.fromKey(String key) => DataSegment.values.firstWhere(
    (e) => e.name == key,
    orElse: () => DataSegment.user,
  );
}

enum AccountSegment {
  user('account_segment_1');

  final String labelKey;

  const AccountSegment(this.labelKey);

  String get label => Intl.message(labelKey);

  factory AccountSegment.fromKey(String key) => AccountSegment.values
      .firstWhere((e) => e.name == key, orElse: () => AccountSegment.user);
}
