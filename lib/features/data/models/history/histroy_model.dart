import 'package:cofee/features/data/models/history/orders_by_organization_model.dart';
import 'package:cofee/features/domain/entiti/history/history_entiti.dart';
import 'package:cofee/features/domain/entiti/history/orders_by_organization_entiti.dart';

class HistroyModel extends HistroyEntiti {
  HistroyModel({
    required final String correlationId,
    required final int maxRevision,
    required final List<OrdersByOrganizationEntiti> ordersByOrganizations,
  }) : super(
          correlationId: correlationId,
          maxRevision: maxRevision,
          ordersByOrganizations: ordersByOrganizations,
        );
  factory HistroyModel.fromJson(Map<String, dynamic> json) => HistroyModel(
        correlationId: json["correlationId"],
        maxRevision: json["maxRevision"],
        ordersByOrganizations: List<OrdersByOrganizationModel>.from(
            json["ordersByOrganizations"]
                .map((x) => OrdersByOrganizationModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "correlationId": correlationId,
        "maxRevision": maxRevision,
        "ordersByOrganizations": ordersByOrganizations,
      };
}
