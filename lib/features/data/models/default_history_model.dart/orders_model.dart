
import 'package:cofee/features/data/models/default_history_model.dart/order_model.dart';
import 'package:cofee/features/domain/entiti/default_history_entiti.dart/order_entiti.dart';
import 'package:cofee/features/domain/entiti/default_history_entiti.dart/orders_entiti.dart';


class OrdersModel extends OrdersEntiti{
  OrdersModel({
    required final String id,
    required final String? posId,
    required final dynamic externalNumber,
    required final String organizationId,
    required final int timestamp,
    required final String creationStatus,
    required final dynamic errorInfo,
    required final OrderEntiti order,
  }):super(
    id: id,
    posId: posId,
    externalNumber: externalNumber,
    organizationId: organizationId,
    timestamp: timestamp,
    creationStatus: creationStatus,
    errorInfo: errorInfo,
    order: order,
  );
  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        id: json["id"],
        posId: json["posId"],
        externalNumber: json["externalNumber"],
        organizationId: json["organizationId"],
        timestamp: json["timestamp"],
        creationStatus: json["creationStatus"],
        errorInfo: json["errorInfo"],
        order: OrderModel.fromJson(json["order"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "posId": posId,
        "externalNumber": externalNumber,
        "organizationId": organizationId,
        "timestamp": timestamp,
        "creationStatus": creationStatus,
        "errorInfo": errorInfo,
        "order": order,
    };
}
