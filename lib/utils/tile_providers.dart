import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate:
          'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
      retinaMode: true,
      subdomains: const ['a', 'b', 'c'],
      maxZoom: 20,
      tileProvider: CancellableNetworkTileProvider(),
    );
