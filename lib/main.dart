import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nano_health_assesment/presentation/blocs/auth/AuthBloc.dart';
import 'package:nano_health_assesment/presentation/blocs/product/ProductBloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> AuthBloc()),
        BlocProvider(create: (_)=> ProductBloc())
      ],
      child: MaterialApp(
        title: 'Nano Health',
        debugShowCheckedModeBanner: false,
        home: const RootApp()
      ),
    );
  }
}
