import 'package:flutter/material.dart';
import 'package:foodform/pages/order_item.dart';
import 'package:foodform/widgets/navigation.dart';

class ScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Scan menu")),
        drawer: NavigationDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  color: Colors.white,
                  padding: const EdgeInsets.all(15.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderItemPage(1)),
                    );
                  },
                  child:
                      Text('Order Stoofvlees', style: TextStyle(fontSize: 16)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  color: Colors.white,
                  padding: const EdgeInsets.all(15.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderItemPage(2)),
                    );
                  },
                  child: Text('Order Mosselen', style: TextStyle(fontSize: 16)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  color: Colors.white,
                  padding: const EdgeInsets.all(15.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderItemPage(3)),
                    );
                  },
                  child: Text('Order Pizza', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ));
  }
}
