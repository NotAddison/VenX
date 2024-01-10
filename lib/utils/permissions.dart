import 'package:flutter/material.dart';
import "package:permission_handler/permission_handler.dart";
import "package:fluttertoast/fluttertoast.dart";

// Check for location permission
Future<bool> checkLocationPermission() async {
  if (!await Permission.location.isGranted) {
    await Permission.location.request();
    if (!await Permission.location.isGranted) {
      Fluttertoast.showToast(
          msg: "Location permission is required to use this app.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
  }

  print("PERMISSION GRANTED");
  return false;
}
