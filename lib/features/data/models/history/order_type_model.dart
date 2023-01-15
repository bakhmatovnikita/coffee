import 'package:cofee/features/domain/entiti/history/order_type_entiti.dart';

class OrderTypeModel extends OrderTypeEntiti {
  OrderTypeModel({
    required final String id,
    required final String name,
    required final String orderServiceType,
  }) : super(
          id: id,
          name: name,
          orderServiceType: orderServiceType,
        );
  factory OrderTypeModel.fromJson(Map<String, dynamic> json) => OrderTypeModel(
        id: json["id"],
        name: json["name"],
        orderServiceType: json["orderServiceType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "orderServiceType": orderServiceType,
      };
}
