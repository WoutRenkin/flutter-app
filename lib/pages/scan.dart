import 'package:flutter/material.dart';
import 'package:foodform/widgets/navigation.dart';

class ScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scan menu")),
      drawer: NavigationDrawer(),
      body: Center(child: Text('Scan Page')),
    );
  }
}
