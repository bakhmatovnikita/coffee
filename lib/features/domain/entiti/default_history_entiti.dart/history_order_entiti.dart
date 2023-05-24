


import 'package:cofee/features/domain/entiti/default_history_entiti.dart/orders_entiti.dart';

class HistoryOrderEntiti {
  final String correlationId;
  final List<OrdersEntiti> orders;

  HistoryOrderEntiti({
    required this.correlationId,
    required this.orders,
  });
}
