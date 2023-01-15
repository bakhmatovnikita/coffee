import 'package:cofee/features/domain/entiti/history/orders_by_organization_entiti.dart';

class HistroyEntiti {
  final String correlationId;
  final int maxRevision;
  final List<OrdersByOrganizationEntiti> ordersByOrganizations;

  HistroyEntiti({
    required this.correlationId,
    required this.maxRevision,
    required this.ordersByOrganizations,
  });
}
