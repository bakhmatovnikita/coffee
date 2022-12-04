import 'package:cofee/features/domain/entiti/products/groups_entiti.dart';

import 'product_entiti.dart';

class ProductsEntiti {
  final List<GroupsEntiti> groups;
  final List<ProductEntiti> products;

  ProductsEntiti({
    required this.groups,
    required this.products,
  });
}
