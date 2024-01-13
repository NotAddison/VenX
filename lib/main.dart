import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import './widgets/main_base.dart';
import 'utils/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();

    // Set the refresh rate to 120Hz if mobile
    if (!kIsWeb) {
      FlutterDisplayMode.setHighRefreshRate();
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
        title: 'VenX',
        debugShowCheckedModeBanner: false,
        theme: defaultTheme,
        home: const MainScaffold(),
        routes: <String, WidgetBuilder>{
          '': (BuildContext context) => const MainScaffold(),
        });
  }
}
