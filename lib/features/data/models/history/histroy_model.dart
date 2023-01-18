import 'package:cofee/features/data/models/history/orders_by_organization_model.dart';
import 'package:cofee/features/domain/entiti/history/history_entiti.dart';
import 'package:cofee/features/domain/entiti/history/orders_by_organization_entiti.dart';

class HistoryModel extends HistoryEntiti {
  HistoryModel({
    required final String correlationId,
    required final int maxRevision,
    required final List<OrdersByOrganizationEntiti> ordersByOrganizations,
  }) : super(
          correlationId: correlationId,
          maxRevision: maxRevision,
          ordersByOrganizations: ordersByOrganizations,
        );
  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
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
