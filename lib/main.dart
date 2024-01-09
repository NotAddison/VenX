import 'package:flutter/material.dart';

// Screens
import 'screens/home.dart';

// Utils
import 'utils/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VenX',
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: Home(),
    );
  }
}
