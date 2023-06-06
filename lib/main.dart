import 'package:flutter/material.dart';
import 'package:nano_health_assesment/presentation/pages/details_page.dart';
import 'package:nano_health_assesment/presentation/pages/login_page.dart';
import 'package:nano_health_assesment/presentation/pages/root_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nano Health',
      debugShowCheckedModeBanner: false,
      home: const RootApp()
    );
  }
}
