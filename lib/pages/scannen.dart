import 'package:flutter/material.dart';
import 'package:foodform/widgets/navigation.dart';

class ScannenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scan menukaart")),
      drawer: NavigationDrawer(),
      body: Center(child: Text('Scannen')),
    );
  }
}
