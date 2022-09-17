import 'package:flutter/material.dart';
import 'package:tdp2/routes/routes.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  // This widget is the root of your application.
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
