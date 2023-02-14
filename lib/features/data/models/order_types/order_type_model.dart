import 'package:cofee/features/data/models/order_types/item_model.dart';
import 'package:cofee/features/domain/entiti/order_types/order_type_entiti.dart';

import '../../../domain/entiti/order_types/item_entiti.dart';

class OrderTypeModel extends OrderTypeEntiti {
  OrderTypeModel({
    required final String organizationId,
    required final List<ItemEntiti> items,
  }) : super(
          organizationId: organizationId,
          items: items,
        );
  factory OrderTypeModel.fromJson(Map<String, dynamic> json) => OrderTypeModel(
        organizationId: json["organizationId"],
        items: List<ItemEntiti>.from(
            (json["items"] as List<dynamic>).map((x) => ItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "organizationId": organizationId,
        "items": items,
      };
}
