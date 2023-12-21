import 'package:flutter/material.dart';

import 'routing/routes.dart';

void main() {
  final routes = Routes();

  runApp(MyApp(routes: routes));
}

class MyApp extends StatelessWidget {
  final Routes routes;
  const MyApp({super.key, required this.routes});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: routes.router,
    );
  }
}
