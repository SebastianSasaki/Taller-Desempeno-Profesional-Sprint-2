import 'package:flutter/material.dart';
import 'package:tdp_sprint_2/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TDP Sprint 2",
      initialRoute: AppRoutes.initialRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      routes: AppRoutes.routes,
    ) ;
  }
}
