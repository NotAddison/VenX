import 'package:flutter/material.dart';

// Widgets
import '../utils/permissions.dart';

// Map Lib + Tiles
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../utils/tile_providers.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Check for location permission
    checkLocationPermission();

    // Main Scaffold
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter:
                  const LatLng(1.3764566939567504, 103.80547380680981),
              initialZoom: 13,
              maxZoom: 20,
              cameraConstraint: CameraConstraint.contain(
                bounds: LatLngBounds(
                  const LatLng(1.1625815042633, 104.22902200581069),
                  const LatLng(1.5533239820654057, 103.3997338508129),
                ),
              ),
            ),
            children: [
              openStreetMapTileLayer,
            ],
          ),
        ],
      ),
    );
  }
}
