import 'package:flutter/material.dart';
import '../api/foodform_api.dart';
import '../models/meal.dart';
import '../models/order.dart';
import '../widgets/navigation.dart';
import 'ordercomplete.dart';

class OrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderPage();
}

class _OrderPage extends State {
  List<Order> orderList = List<Order>();
  List<Meal> mealList = List<Meal>();
  int orderCount = 0;
  int totalPrice = 0;

  //Loading is set on true and will be put on false after API data is loaded. 
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Orders"),
          actions: <Widget>[
            PopupMenuButton<int>(
              onSelected: _deleteAllOrders,
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text("Delete all orders"),
                ),
              ],
            )
          ],
        ),
        drawer: NavigationDrawer(),
        body: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Center(
                  child: loading
                      ? CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.grey),
                        )
                      : _orderList(),
                )),
                Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Total price: €" + calcTotalPrice(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20))),
                SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.white,
                      child: Text("Order",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      onPressed: _orderComplete,
                    ))
              ],
            )));
  }

  //This function builds the orderList and displays current orders as cards.
  _orderList() {
    return orderList.isEmpty
        ? Center(
            child: Text(
                'No orders yet, use the scan menu page to order your food!'))
        : ListView.builder(
            itemCount: orderCount,
            itemBuilder: (BuildContext context, int position) {
              return Card(
                color: Colors.white,
                elevation: 3.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ListTile(
                    leading: Image.asset('assets/img/' +
                        mealList[orderList[position].mealID - 1].picture),
                    title: Text(mealList[orderList[position].mealID - 1].name),
                    subtitle: Text('tafel: ' +
                        orderList[position].table.toString() +
                        '\naantal: ' +
                        orderList[position].amount.toString()),
                    trailing: Column(
                      children: <Widget>[
                        Container(
                          child: IconButton(
                              icon: Icon(Icons.delete),
                              color: Colors.black,
                              onPressed: () =>
                                  _deleteOrder(orderList[position].id)),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }

  //When pressed orders will be deleted and user will be navigated to order complete page.
  void _orderComplete() {
    
    for (int i = 0; i < orderList.length; i++) {
        FoodFormAPI.deleteOrder(orderList[i].id);
    }

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OrderCompletePage()),
      );

  }

  //Delete all orders when pressed "Delete all orders" popupdropdown menu in navbar 
  void _deleteAllOrders(value) {
    if (value == 1) {

      //Loop the delet API with order ID
      for (int i = 0; i < orderList.length; i++) {
        FoodFormAPI.deleteOrder(orderList[i].id);
      }

      //Reset orderList state and order count
      setState(() {
        orderList = List();
        orderCount = 0;
      });
    }
  }

  //Delete order based on order id
  void _deleteOrder(id) {

    //Reload page after we deleted the order so we make sure we are showing the orders currently in our API.
    FoodFormAPI.deleteOrder(id).then((result) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OrderPage()),
      );
    });
  }

  //Load all API data (Orders and Meals) and fill our state lists to load our cards.
  void _getData() async {
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

  //Calculate total price of all orders
  String calcTotalPrice() {
    double totalprice = 0;
    double price;
    if (orderList.isEmpty || mealList.isEmpty) {
      totalprice = 0;
    } else {
      orderList.forEach((order) {
        price = 0;
        price = double.parse(mealList[order.mealID - 1].price) * order.amount;
        totalprice = totalprice + price;
      });
    }
    return totalprice.toStringAsFixed(2);
  }
}
