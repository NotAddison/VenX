import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Screens
import './widgets/main_base.dart';

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
