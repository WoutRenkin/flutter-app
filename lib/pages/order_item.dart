import 'package:flutter/material.dart';
import '../api/foodform_api.dart';
import '../models/meal.dart';
import '../models/order.dart';
import '../widgets/navigation.dart';

class OrderItemPage extends StatefulWidget {
  final int id;
  OrderItemPage(this.id);

  @override
  State<StatefulWidget> createState() => _OrderItemPage(id);
}

class _OrderItemPage extends State {
  int id;
  _OrderItemPage(this.id);

  int _amountValue = 0;
  int _tableValue = 0;
  bool loading = true;

  Meal meal;
  Order order;

  @override
  void initState() {
    super.initState();
    _getMeal(id);
    order = new Order(mealID: null, amount: null, table: null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order meal"),
        ),
        drawer: NavigationDrawer(),
        body: Center(
            child: loading
                ? CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.grey),
                  )
                : _orderItemForm()));
  }

  _orderItemForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "Order " + meal.name,
          style: TextStyle(fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              child: DropdownButton(
                  value: _amountValue,
                  underline: Container(
                    height: 1,
                    color: Colors.black,
                  ),
                  items: [
                    DropdownMenuItem(child: Text("Amount"), value: 0),
                    DropdownMenuItem(child: Text("1"), value: 1),
                    DropdownMenuItem(child: Text("2"), value: 2),
                    DropdownMenuItem(child: Text("3"), value: 3),
                    DropdownMenuItem(child: Text("4"), value: 4),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _amountValue = value;
                    });
                  }),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: DropdownButton(
                  value: _tableValue,
                  underline: Container(
                    height: 1,
                    color: Colors.black,
                  ),
                  items: [
                    DropdownMenuItem(child: Text("Table     "), value: 0),
                    DropdownMenuItem(child: Text("1"), value: 1),
                    DropdownMenuItem(child: Text("2"), value: 2),
                    DropdownMenuItem(child: Text("3"), value: 3),
                    DropdownMenuItem(child: Text("4"), value: 4),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _tableValue = value;
                    });
                  }),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.white,
              padding: const EdgeInsets.all(15.0),
              onPressed: () {
                _addOrder();
              },
              child: Text('Submit', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ],
    );
  }

  void _getMeal(int id) {
    FoodFormAPI.fetchMeal(id).then((result) {
      setState(() {
        meal = result;
        loading = false;
      });
    });
  }

  void _addOrder() {
    order.mealID = id;
    order.amount = _amountValue;
    order.table = _tableValue;
    if (order.amount == 0 || order.table == 0) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Order"),
                content:
                    Text("Make sure to select an amount and table number."),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ));
    } else {
      FoodFormAPI.createOrder(order).then((result) {
        Navigator.pop(context, true);
      });
    }
  }
}
