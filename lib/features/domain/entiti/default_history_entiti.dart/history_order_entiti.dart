import 'package:cofee/features/domain/entiti/cart/order_entiti.dart';

class HistoryOrderEntiti {
  final String correlationId;
  final List<OrderEntiti> orders;

  HistoryOrderEntiti({
    required this.correlationId,
    required this.orders,
  });
}
