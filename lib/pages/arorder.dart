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
          //Load our ARFoodFormWidget which will trigger Wikitude
          child: ArFoodFormWidget()),
    );
  }
}