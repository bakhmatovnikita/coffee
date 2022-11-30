import 'package:cofee/features/auth/presentation/data/models/products/size_price_models.dart';
import 'package:cofee/features/auth/presentation/domain/entiti/products/product_entiti.dart';
import 'package:cofee/features/auth/presentation/domain/entiti/products/size_price_entiti.dart';

class ProductModel extends ProductEntiti {
  ProductModel({
    required final double fatAmount,
    required final double proteinsAmount,
    required final double carbohydratesAmount,
    required final double energyAmount,
    required final double fatFullAmount,
    required final double proteinsFullAmount,
    required final double carbohydratesFullAmount,
    required final double energyFullAmount,
    required final double weight,
    required final List<SizePriceEntiti> sizePrices,
    required final List<String> imageLink,
    required final String name,
    required final String parentGroup,
  }) : super(
            fatAmount: fatAmount,
            proteinsAmount: proteinsAmount,
            carbohydratesAmount: carbohydratesAmount,
            energyAmount: energyAmount,
            fatFullAmount: fatFullAmount,
            proteinsFullAmount: proteinsFullAmount,
            carbohydratesFullAmount: carbohydratesFullAmount,
            energyFullAmount: energyFullAmount,
            weight: weight,
            sizePrices: sizePrices,
            name: name,
            imageLink: imageLink,
            parentGroup: parentGroup);
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        fatAmount: json['fatAmount'],
        proteinsAmount: json['proteinsAmount'],
        carbohydratesAmount: json['carbohydratesAmount'],
        energyAmount: json['energyAmount'],
        fatFullAmount: json['fatFullAmount'],
        proteinsFullAmount: json['proteinsFullAmount'],
        carbohydratesFullAmount: json['carbohydratesFullAmount'],
        energyFullAmount: json['energyFullAmount'],
        weight: json['weight'],
        sizePrices: List<SizePriceEntiti>.from(json["sizePrices"].map((x) => SizePriceModels.fromJson(x))),
        name: json['name'],
        imageLink: List<String>.from((json["imageLinks"] as List<dynamic>)
                    .map((x) => x) 
                    .toList()) ==
                0
            ? List<String>.from(
                (json["imageLinks"] as List<dynamic>).map((x) => x).toList())
            : List<String>.from(
                (json["imageLinks"] as List<dynamic>).map((x) => x).toList()),
        parentGroup: json["parentGroup"] ?? "",
      );
}
