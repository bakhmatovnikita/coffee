import 'package:cofee/features/domain/entiti/order_info_entiti.dart';

class OrderEntiti {
  final String correlationId;
  final OrderInfoEntiti orderInfo;

  OrderEntiti({
    required this.correlationId,
    required this.orderInfo,
  });
}
