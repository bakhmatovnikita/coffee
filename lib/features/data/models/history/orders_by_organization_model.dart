import 'package:cofee/features/data/models/history/order_element_model.dart';
import 'package:cofee/features/domain/entiti/history/order_element_entiti.dart';
import 'package:cofee/features/domain/entiti/history/orders_by_organization_entiti.dart';

class OrdersByOrganizationModel extends OrdersByOrganizationEntiti {
  OrdersByOrganizationModel({
    required final String organizationId,
    required final List<OrderElementEntiti> orders,
  }) : super(
          organizationId: organizationId,
          orders: orders,
        );
  factory OrdersByOrganizationModel.fromJson(Map<String, dynamic> json) =>
      OrdersByOrganizationModel(
        organizationId: json["organizationId"],
        orders: List<OrderElementModel>.from(
            json["orders"].map((x) => OrderElementModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "organizationId": organizationId,
        "orders": orders,
      };
}
