import 'package:flutter/material.dart';
import '../widgets/foodformar.dart';

class ArOrderPage extends StatefulWidget {
  @override
  _ArOrderPageState createState() => _ArOrderPageState();
}

class _ArOrderPageState extends State<ArOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan a menu"),
      ),
      body: Center(
          // Here we load the Widget with the AR Dino experience
          child: ArFoodFormWidget()),
    );
  }
}