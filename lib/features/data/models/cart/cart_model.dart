// class CartItemsModel {
//   final List<CartModel> cartModel;

//   CartItemsModel({required this.cartModel});

//   factory CartItemsModel.fromJson(Map<String, dynamic> json) => CartItemsModel(
//         cartModel: List<CartModel>.from(
//           (json['cartModel'] as List<dynamic>).map(
//             (cartItemsModel) => CartModel.fromJson(cartItemsModel),
//           ),
//         ).toList(),
//       );

//   Map<String, dynamic> toJson() {
//     return {
//       'cartModel': cartModel,
//     };
//   }
// }

class CartModel {
  final String name;
  final String fatFullAmount;
  final double weight;
  final String proteinsFullAmount;
  final String carbohydratesFullAmount;
  final double sizePrices;
  final List<dynamic> imageLink;
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
    };
  }


}
