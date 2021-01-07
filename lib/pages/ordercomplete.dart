import 'package:flutter/material.dart';
import '../widgets/navigation.dart';

class OrderCompletePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Order Complete")),
        drawer: NavigationDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Thanks for ordering with foodform!',
              style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(
                height: 10.0,
              ),
              Text("Your order was received and is being prepared!")
            ],
          ),
        ));
  }
}
