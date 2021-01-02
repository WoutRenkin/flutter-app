import 'package:flutter/material.dart';
import 'package:foodform/widgets/navigation.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: NavigationDrawer(),
      body: Center(child: Text('Homepage')),
    );
  }
}
