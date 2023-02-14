import 'package:cofee/features/domain/entiti/order_types/item_entiti.dart';

class OrderTypeEntiti {
  final String organizationId;
  final List<ItemEntiti> items;

  OrderTypeEntiti({
    required this.organizationId,
    required this.items,
  });
}
