import 'package:flutter/material.dart';
import '../pages/orders.dart';
import '../pages/home.dart';
import '../pages/scan.dart';

//Here we define our navigation drawer, it creates the navigation hamburger icon and lets us add navigation to all pages.

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.asset('assets/icons/icon.png'),
            decoration: BoxDecoration(
              color: Colors.grey[20],
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
            title: Text('Scan menu'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScanPage()),
              );
            },
          ),
          ListTile(
            title: Text('Orders'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
