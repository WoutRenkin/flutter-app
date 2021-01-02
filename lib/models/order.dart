class Order {
  int orderID;
  int mealID;
  int amount;
  int table;

  Order({this.orderID, this.mealID, this.amount, this.table});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderID: json['order_id'],
      mealID: json['meal_id'],
      amount: json['amount'],
      table: json['table'],
    );
  }

  Map<String, dynamic> toJson() => {
        'meal_id': mealID,
        'amount': amount,
        'table': table,
      };
}
