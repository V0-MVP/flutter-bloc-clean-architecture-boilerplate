import 'package:bloc_clean_architecture/src/comman/themes.dart';
import 'package:flutter/material.dart';

import 'src/utilities/go_router_init.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'flutter bloc clean architecture',
      theme: themeLight(context),
      darkTheme: themeDark(context),
      themeMode: ThemeMode.system,
      routerConfig: routerinit,
    );
  }
}
