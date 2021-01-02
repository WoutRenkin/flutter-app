import 'package:flutter/material.dart';
import 'package:foodform/pages/bestellingen.dart';
import 'package:foodform/pages/home.dart';
import 'package:foodform/pages/scannen.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('FoodForm'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            title: Text('Scannen'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScannenPage()),
              );
            },
          ),
          ListTile(
            title: Text('Bestellingen'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BestellingenPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
