import 'package:flutter/material.dart';
import 'package:foodform/api/foodform_api.dart';
import 'package:foodform/models/meal.dart';
import 'package:foodform/models/order.dart';
import 'package:foodform/widgets/navigation.dart';

class BestellingenPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BestellingenPage();
}

class _BestellingenPage extends State {
  List<Order> orderList = List<Order>();
  int orderCount = 0;

  List<Meal> mealList = List<Meal>();

  @override
  void initState() {
    super.initState();
    _getMeals();
    _getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bestellingen")),
      drawer: NavigationDrawer(),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: _bestellingenList(),
      ),
    );
  }

  ListView _bestellingenList() {
    return ListView.builder(
      itemCount: orderCount,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 3.0,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: ListTile(
              title: Text(mealList[orderList[position].mealID - 1].name),
              subtitle: Text('tafel: ' +
                  orderList[position].table.toString() +
                  '\naantal: ' +
                  orderList[position].amount.toString()),
            ),
          ),
        );
      },
    );
  }

  void _getOrders() {
    FoodFormAPI.fetchOrders().then((result) {
      setState(() {
        orderList = result;
        orderCount = result.length;
      });
    });
  }

  void _getMeals() {
    FoodFormAPI.fetchMeals().then((result) {
      setState(() {
        mealList = result;
      });
    });
  }
}
