import 'package:cofee/features/domain/entiti/history/order_element_entiti.dart';

class OrdersByOrganizationEntiti {
  final String organizationId;
  final List<OrderElementEntiti> orders;

  OrdersByOrganizationEntiti({
    required this.organizationId,
    required this.orders,
  });
}
