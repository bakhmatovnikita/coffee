import 'package:cofee/features/data/models/history/error_info_model.dart';
import 'package:cofee/features/data/models/history/orders_order_model.dart';
import 'package:cofee/features/domain/entiti/history/error_info_entiti.dart';
import 'package:cofee/features/domain/entiti/history/order_element_entiti.dart';

import '../../../domain/entiti/history/orders_order_entiti.dart';

class OrderElementModel extends OrderElementEntiti {
  OrderElementModel({
    required final String id,
    required final String externalNumber,
    required final String organizationId,
    required final int timestamp,
    required final String creationStatus,
    required final ErrorInfoEntiti errorInfo,
    required final OrdersOrderEntiti order,
  }) : super(
          id: id,
          externalNumber: externalNumber,
          organizationId: organizationId,
          timestamp: timestamp,
          creationStatus: creationStatus,
          errorInfo: errorInfo,
          order: order,
        );
  factory OrderElementModel.fromJson(Map<String, dynamic> json) =>
      OrderElementModel(
        id: json["id"],
        externalNumber: json["externalNumber"],
        organizationId: json["organizationId"],
        timestamp: json["timestamp"],
        creationStatus: json["creationStatus"],
        errorInfo: ErrorInfoModel.fromJson(json["errorInfo"]),
        order: OrdersOrderModel.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "externalNumber": externalNumber,
        "organizationId": organizationId,
        "timestamp": timestamp,
        "creationStatus": creationStatus,
        "errorInfo": errorInfo,
        "order": order,
      };
}
