
import 'package:cofee/features/domain/entiti/order_types/order_type_entiti.dart';

class OrderTypesEntiti {
  final String correlationId;
  final List<OrderTypeEntiti> orderTypes;

  OrderTypesEntiti({
    required this.correlationId,
    required this.orderTypes,
  });
}
