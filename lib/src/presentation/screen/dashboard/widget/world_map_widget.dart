import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taskflow/src/data/data.dart';
import 'package:taskflow/src/presentation/controller/controller.dart';
import 'package:taskflow/src/presentation/widget/widget.dart';
import 'package:taskflow/src/router/router.dart';

class WorldMapWidget extends HookConsumerWidget {
  const WorldMapWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final state = ref.watch(worldMapControllerProvider);
    final dummy = WidgetPreset(context).dummyClientCount;

    final markers = WidgetPreset(context).markers;

    final parser = useState<GeoJsonParser>(GeoJsonParser());
    final selectedMarker = useState<ClientMarker?>(null);

    useEffect(() {
      Future.microtask(() async {
        final data = await DefaultAssetBundle.of(
          context,
        ).loadString('assets/files/map.json');
        final geoJsonData = json.decode(data);

        // GeometryCollection을 지원하도록 수정
        List<Polygon> polygons = [];
        final features = geoJsonData['features'] as List;

        for (var feature in features) {
          final geometry = feature['geometry'];
          if (geometry['type'] == 'GeometryCollection') {
            final geometries = geometry['geometries'];
            for (var geom in geometries) {
              if (geom['type'] == 'Polygon') {
                // Polygon 처리
                polygons.add(
                  Polygon(
                    points: geom['coordinates'][0]
                        .map<LatLng>((coord) => LatLng(coord[1], coord[0]))
                        .toList(),
                    borderColor: colorScheme.outline,
                    color: colorScheme.outline.withValues(alpha: 0.2),
                    borderStrokeWidth: 0.4, // 경계선 두께
                  ),
                );
              }
            }
          }
        }

        parser.value = GeoJsonParser()..polygons.addAll(polygons);
      });
      return null;
    }, []);

    return LayoutBuilder(
      builder: (context, constraints) {
        // 최소, 최대 너비에 따른 비율 계산 (예: 300 ~ 1200)
        const minWidth = 300.0;
        const maxWidth = 1200.0;
        const minZoom = -0.5;
        const maxZoom = 1.0;

        // 너비를 0~1 사이로 정규화
        double normalizedWidth =
            ((constraints.maxWidth - minWidth) / (maxWidth - minWidth)).clamp(
              0.0,
              1.0,
            );

        // 선형 보간을 통해 줌 계산
        final initialZoom = minZoom + (maxZoom - minZoom) * normalizedWidth;

        return ContainerWidget(
          padding: EdgeInsets.zero,
          child: Stack(
            children: [
              switch (state) {
                AsyncData(:final value) => _DesktopWidget(items: value.items),
                AsyncError(:final error, :final stackTrace) =>
                  ErrorContainerWidget(error: error, stackTrace: stackTrace),
                _ => Skeletonizer(child: _DesktopWidget(items: dummy)),
              },
              FlutterMap(
                mapController: MapController(),
                options: MapOptions(
                  crs: Epsg4326(),
                  initialCenter: LatLng(12.0, -40.0),
                  initialZoom: initialZoom,
                  backgroundColor: Colors.transparent,
                ),
                children: [
                  PolygonLayer(polygons: parser.value.polygons),
                  MarkerLayer(
                    markers: markers.map<Marker>((marker) {
                      return Marker(
                        point: LatLng(marker.latitude, marker.longitude),
                        width: 12.0,
                        height: 12.0,
                        child: MouseRegion(
                          onEnter: (value) => selectedMarker.value = marker,
                          onExit: (value) => selectedMarker.value = null,
                          child: Tooltip(
                            preferBelow: false,
                            enableTapToDismiss: false,
                            verticalOffset: 12.0,
                            richMessage: WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: marker.items.map((item) {
                                    final index = marker.items.indexOf(item);

                                    return Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          context.goNamed(
                                            RouteNames.project,
                                            queryParameters: {
                                              'search': item.name,
                                            },
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            bottom:
                                                index != marker.items.length - 1
                                                ? 4.0
                                                : 0.0,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.all(
                                                  4.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        4.0,
                                                      ),
                                                  color: Color(
                                                    ClientType.values
                                                        .singleWhere(
                                                          (client) =>
                                                              client.id ==
                                                              marker
                                                                  .items[index]
                                                                  .type
                                                                  .id,
                                                        )
                                                        .color,
                                                  ),
                                                ),
                                                child: SizedBox(
                                                  width: 12.0,
                                                  height: 12.0,
                                                  child: SvgPicture.asset(
                                                    ClientType.values
                                                        .singleWhere(
                                                          (client) =>
                                                              client.id ==
                                                              marker
                                                                  .items[index]
                                                                  .type
                                                                  .id,
                                                        )
                                                        .asset,
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                          Colors.white,
                                                          BlendMode.srcIn,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 6.0),
                                              Text(
                                                marker.items[index].name,
                                                style: textTheme.bodySmall
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedMarker.value == marker
                                      ? colorScheme.primary
                                      : colorScheme.outline,
                                  width: 4.0,
                                ),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DesktopWidget extends StatelessWidget {
  final List<ClientCount> items;

  const _DesktopWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intl.message('dashboard_world_map_1'),
            style: TextStyle(
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          Text.rich(
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            TextSpan(
              children: [
                TextSpan(
                  text:
                      '${items.singleWhere((element) => element.depth == 1).count} ',
                ),
                TextSpan(
                  text: Intl.message('dashboard_world_map_1_1'),
                  style: textTheme.titleSmall,
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0),
          Text(
            Intl.message('dashboard_world_map_2'),
            style: TextStyle(
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          Text.rich(
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            TextSpan(
              children: [
                TextSpan(
                  text:
                      '${items.singleWhere((element) => element.depth == 2).count} ',
                ),
                TextSpan(
                  text: Intl.message('dashboard_world_map_2_1'),
                  style: textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
