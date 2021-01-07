import 'package:flutter/material.dart';
import '../widgets/foodformar.dart';
import '../widgets/navigation.dart';

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
      drawer: NavigationDrawer(),
      body: Center(
          // Here we load the Widget with the AR Dino experience
          child: ArFoodFormWidget()),
    );
  }
}