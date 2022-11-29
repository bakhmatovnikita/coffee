import 'package:cofee/features/auth/presentation/data/models/products/groups_models.dart';
import 'package:cofee/features/auth/presentation/data/models/products/product_model.dart';
import 'package:cofee/features/auth/presentation/domain/entiti/products/groups_entiti.dart';
import 'package:cofee/features/auth/presentation/domain/entiti/products/product_entiti.dart';
import 'package:cofee/features/auth/presentation/domain/entiti/products/products_entiti.dart';

class ProductsModel extends ProductsEntiti {
  ProductsModel({
    required final List<GroupsEntiti> groups,
    required List<ProductEntiti> products,
  }) : super(
          groups: groups,
          products: products,
        );
  factory ProductsModel.fromJson(Map<String, dynamic>json) => ProductsModel(
        groups: List<GroupsEntiti>.from((json["groups"] as List<dynamic>)
            .map((x) => GroupsModels.fromJson(x))
            .toList()),
        products: List<ProductEntiti>.from((json["products"] as List<dynamic>)
            .map((x) => ProductModel.fromJson(x))
            .toList()),
      );
}
