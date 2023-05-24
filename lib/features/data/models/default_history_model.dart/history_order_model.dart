import 'package:cofee/features/data/models/default_history_model.dart/orders_model.dart';
import 'package:cofee/features/domain/entiti/default_history_entiti.dart/history_order_entiti.dart';
import 'package:cofee/features/domain/entiti/default_history_entiti.dart/orders_entiti.dart';

class HistoryOrderModel extends HistoryOrderEntiti {
  HistoryOrderModel({
    required final String correlationId,
    required final List<OrdersEntiti> orders,
  }) : super(
          correlationId: correlationId,
          orders: orders,
        );
  factory HistoryOrderModel.fromJson(Map<String, dynamic> json) =>
      HistoryOrderModel(
        correlationId: json["correlationId"],
        orders: List<OrdersEntiti>.from(
            (json["orders"]as List<dynamic>).map((x) => OrdersModel.fromJson(x)).toList()),
      );

  Map<String, dynamic> toJson() => {
        "correlationId": correlationId,
        "orders": orders,
      };
}
