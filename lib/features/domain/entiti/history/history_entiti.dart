import 'package:cofee/features/domain/entiti/history/orders_by_organization_entiti.dart';

class HistoryEntiti {
  final String correlationId;
  final int maxRevision;
  final List<OrdersByOrganizationEntiti> ordersByOrganizations;

  HistoryEntiti({
    required this.correlationId,
    required this.maxRevision,
    required this.ordersByOrganizations,
  });
}
