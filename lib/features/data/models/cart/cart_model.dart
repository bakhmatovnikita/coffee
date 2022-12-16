class CartModel {
  final String name;
  final String fatFullAmount;
  final double weight;
  final String proteinsFullAmount;
  final String carbohydratesFullAmount;
  final double sizePrices;
  final List<dynamic> imageLink;
  final String productId;
  int count;

  CartModel({
    required this.name,
    required this.fatFullAmount,
    required this.weight,
    required this.proteinsFullAmount,
    required this.carbohydratesFullAmount,
    required this.sizePrices,
    required this.imageLink,
    required this.count,
    required this.productId,
  });
  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        name: json['name'],
        fatFullAmount: json['fatFullAmount'],
        weight: json['weight'],
        proteinsFullAmount: json['proteinsFullAmount'],
        carbohydratesFullAmount: json['carbohydratesFullAmount'],
        sizePrices: json['sizePrices'],
        imageLink: json['imageLink'],
        count: json['count'],
        productId: json['productId']
      );
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'fatFullAmount': fatFullAmount,
      'weight': weight,
      'proteinsFullAmount': proteinsFullAmount,
      'carbohydratesFullAmount': carbohydratesFullAmount,
      'sizePrices': sizePrices,
      'imageLink': imageLink,
      'count': count,
      'productId': productId,
    };
  }


}
