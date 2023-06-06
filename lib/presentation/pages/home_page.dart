
import 'package:flutter/material.dart';
import 'package:nano_health_assesment/presentation/pages/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('All Products', style: TextStyle(color: Colors.black),
        ))
    );

  }
}
