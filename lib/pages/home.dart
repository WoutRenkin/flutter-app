import 'package:flutter/material.dart';
import 'package:foodform/pages/scan.dart';
import 'package:foodform/widgets/navigation.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: NavigationDrawer(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Welcome to FoodForm!", style: TextStyle(fontSize: 20)),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: RaisedButton(
              color: Colors.white,
              padding: const EdgeInsets.all(15.0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScanPage()),
                );
              },
              child: Text('Scan a menu', style: TextStyle(fontSize: 16)),
            ),
          )
        ],
      )),
    );
  }
}
