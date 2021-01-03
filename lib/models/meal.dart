class Meal {
  int id;
  String name;
  String description;
  String picture;
  String price;
  bool egg;
  bool lactose;
  bool gluten;
  bool shellfish;
  bool sesameSeed;
  bool fish;

  Meal({
    this.id,
    this.name,
    this.description,
    this.picture,
    this.price,
    this.egg,
    this.lactose,
    this.gluten,
    this.shellfish,
    this.sesameSeed,
    this.fish,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      picture: json['picture'],
      price: json['price'],
      egg: json['egg'],
      lactose: json['lactose'],
      gluten: json['gluten'],
      shellfish: json['shellfish'],
      sesameSeed: json['sesame_seed'],
      fish: json['fish'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'picture': picture,
        'price': price,
        'egg': egg,
        'lactose': lactose,
        'gluten': gluten,
        'shellfish': shellfish,
        'sesame_seed': sesameSeed,
        'fish': fish,
      };
}
