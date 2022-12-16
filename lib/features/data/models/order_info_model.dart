import 'package:cofee/features/domain/entiti/order_info_entiti.dart';

class OrderInfoModel extends OrderInfoEntiti {
  OrderInfoModel({
    required final String id,
    required final String posId,
    required final String externalNumber,
    required final String organizationId,
    required final int timestamp,
    required final String creationStatus,
    required final String errorInfo,
    required final String order,
  }) : super(
          id: id,
          posId: posId,
          externalNumber: externalNumber,
          organizationId: organizationId,
          timestamp: timestamp,
          creationStatus: creationStatus,
          errorInfo: errorInfo,
          order: order,
        );
  factory OrderInfoModel.fromJson(Map<String, dynamic> json) => OrderInfoModel(
        id: json["id"],
        posId: json["posId"] ?? "",
        externalNumber: json["externalNumber"] ?? "",
        organizationId: json["organizationId"],
        timestamp: json["timestamp"],
        creationStatus: json["creationStatus"],
        errorInfo: json["errorInfo"] ?? "",
        order: json["order"] ?? "",
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
