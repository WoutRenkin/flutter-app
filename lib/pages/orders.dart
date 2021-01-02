import 'package:flutter/material.dart';
import 'package:foodform/api/foodform_api.dart';
import 'package:foodform/models/meal.dart';
import 'package:foodform/models/order.dart';
import 'package:foodform/widgets/navigation.dart';

class OrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderPage();
}

class _OrderPage extends State {
  List<Order> orderList = List<Order>();
  List<Meal> mealList = List<Meal>();
  int orderCount = 0;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Orders")),
      drawer: NavigationDrawer(),
      body: Center(
        child: loading
            ? CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.grey),
              )
            : _orderList(),
      ),
    );
  }

  ListView _orderList() {
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

  void _getData() {
    FoodFormAPI.fetchOrders().then((result) {
      setState(() {
        orderList = result;
        orderCount = result.length;
      });
    });

    FoodFormAPI.fetchMeals().then((result) {
      setState(() {
        mealList = result;
        loading = false;
      });
    });
  }
}
