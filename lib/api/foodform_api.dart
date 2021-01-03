import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/order.dart';
import '../models/meal.dart';

class FoodFormAPI {
  static String url = 'https://shaggy-turkey-61.loca.lt';

  // ORDERS
  // GET order
  static Future<List<Order>> fetchOrders() async {
    final response = await http.get(url + '/orders');

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((order) => new Order.fromJson(order)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }

  // MEALS
  // GET meals
  static Future<List<Meal>> fetchMeals() async {
    final response = await http.get(url + '/meals');

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((meal) => new Meal.fromJson(meal)).toList();
    } else {
      throw Exception('Failed to load meals');
    }
  }

  // GET meal/{id}
  static Future<Meal> fetchMeal(int id) async {
    final response = await http.get(url + '/meals/' + id.toString());
    if (response.statusCode == 200) {
      return Meal.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load meal');
    }
  }

  // POST meal
  static Future<Meal> createMeal(Meal meal) async {
    final http.Response response = await http.post(
      url + '/meals',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(meal),
    );
    if (response.statusCode == 201) {
      return Meal.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create meal');
    }
  }
}
