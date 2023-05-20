import '../../../domain/entiti/default_history_entiti.dart/product_entiti.dart';

class ProductModel extends ProductEntiti {
  ProductModel({
    required final String id,
    required final String name,
  }) : super(
          id: id,
          name: name,
        );
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
