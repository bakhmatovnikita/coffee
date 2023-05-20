import 'package:cofee/features/data/models/default_history_model.dart/order_model.dart';
import 'package:cofee/features/domain/entiti/cart/order_entiti.dart';

import '../../../domain/entiti/default_history_entiti.dart/history_order_entiti.dart';

class HistoryOrderModel extends HistoryOrderEntiti {
  HistoryOrderModel({
    required final String correlationId,
    required final List<OrderEntiti> orders,
  }) : super(
          correlationId: correlationId,
          orders: orders,
        );
  factory HistoryOrderModel.fromJson(Map<String, dynamic> json) =>
      HistoryOrderModel(
        correlationId: json["correlationId"],
        orders: List<OrderEntiti>.from(
            json["orders"].map((x) => OrderModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "correlationId": correlationId,
        "orders": orders,
      };
}
