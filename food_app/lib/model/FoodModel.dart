class FoodModel {
  final String? foodCode;
  final String? name;
  final int? id;
  final String? picture;
  final String? price;

  FoodModel({this.foodCode, this.name, this.id, this.picture, this.price});

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      foodCode: json['food_code'],
      name: json['name'],
      id: json['id'],
      picture: json['picture'],
      price: json['price']
    );
  }
}
