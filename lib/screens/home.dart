import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:venx/widgets/modal.dart';
import '../utils/permissions.dart';
import '../utils/tile_providers.dart';
import '../utils/requests.dart';
import '../models/machine_schema.dart';
import '../widgets/preview_machine.dart';
import 'dart:io' show Platform;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double currentLat = 1.3764566939567504;
  double currentLong = 103.80547380680981;
  List<Marker> machinesMarkers = [];
  // ignore: prefer_typing_uninitialized_variables
  var selectedMachine;

  @override
  void initState() {
    super.initState();
    checkLocationPermission();
    getCurrentLocation();
    renderMachines(); // Call renderMachines instead of getMachines
  }

  void getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        print("Current location: $position");
        currentLat = position.latitude;
        currentLong = position.longitude;
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  Future<void> renderMachines() async {
    List<Machine> machines = await getMachines();
    print(machines);

    // Convert machines into markers
    List<Marker> markers = [];
    for (var i = 0; i < machines.length; i++) {
      markers.add(
        Marker(
          point: LatLng(machines[i].location[0], machines[i].location[1]),
          child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedMachine = machines[i];
                });
              },
              child: Image.asset(
                "assets/images/machine.png",
              )),
          width: 30,
          height: 30,
        ),
      );
    }

    // Add markers to map
    setState(() {
      machinesMarkers = markers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              onTap: (tapPosition, point) {
                setState(() {
                  selectedMachine = null;
                });
              },
              onPointerDown: (event, point) {
                setState(() {
                  selectedMachine = null;
                });
              },
              initialCenter: LatLng(currentLat, currentLong),
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
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(currentLat, currentLong),
                    child: const Icon(Icons.location_searching_outlined),
                    width: 10,
                    height: 10,
                  ),
                  ...machinesMarkers, // Add machinesMarkers here
                ],
              )
            ],
          ),

          // Preview machine
          selectedMachine != null
              ? Positioned(
                  bottom: 100,
                  left: 20,
                  right: 20,
                  child: Container(
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    child: MachinePreview(
                      width: kIsWeb ? 500 : double.maxFinite,
                      machine: selectedMachine,
                    ),
                  ))
              : Container(),
        ],
      ),
    );
  }
}
