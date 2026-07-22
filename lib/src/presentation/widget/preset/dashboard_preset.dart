part of '../widget.dart';

extension DashboardWidgetPreset on WidgetPreset {
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
