class CartModel {
  final String name;
  final String fatFullAmount;
  final String weight;
  final String proteinsFullAmount;
  final String carbohydratesFullAmount;
  final double sizePrices;
  final List<String> imageLink;

  CartModel(
      {required this.name,
      required this.fatFullAmount,
      required this.weight,
      required this.proteinsFullAmount,
      required this.carbohydratesFullAmount,
      required this.sizePrices,
      required this.imageLink});
  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
      name: json['name'],
      fatFullAmount: json['fatFullAmount'],
      weight: json['weight'],
      proteinsFullAmount: json['proteinsFullAmount'],
      carbohydratesFullAmount: json['carbohydratesFullAmount'],
      sizePrices: json['sizePrices'],
      imageLink: json['imageLink']);
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'fatFullAmount': fatFullAmount,
      'weight': weight,
      'proteinsFullAmount': proteinsFullAmount,
      'carbohydratesFullAmount': carbohydratesFullAmount,
      'sizePrices': sizePrices,
      'imageLink': imageLink,
    };
  }
}
