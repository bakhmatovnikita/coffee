
import 'package:cofee/features/data/models/order_types/order_type_model.dart';
import 'package:cofee/features/domain/entiti/order_types/order_types_entiti.dart';

import '../../../domain/entiti/order_types/order_type_entiti.dart';

class OrderTypesModel extends OrderTypesEntiti {
  OrderTypesModel({
    required final String correlationId,
    required final List<OrderTypeEntiti> orderTypes,
  }) : super(
          correlationId: correlationId,
          orderTypes: orderTypes,
        );
  factory OrderTypesModel.fromJson(Map<String, dynamic> json) =>
      OrderTypesModel(
        correlationId: json["correlationId"],
        orderTypes: List<OrderTypeEntiti>.from(
            (json["orderTypes"] as List<dynamic>)
                .map((x) => OrderTypeModel.fromJson(x))
                .toList()),
      );

  Map<String, dynamic> toJson() => {
        "correlationId": correlationId,
        "orderTypes": orderTypes,
      };
}
