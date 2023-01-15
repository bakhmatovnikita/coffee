import 'package:cofee/features/domain/entiti/history/error_info_entiti.dart';
import 'package:cofee/features/domain/entiti/history/orders_order_entiti.dart';

class OrderElementEntiti {
  final String id;
  final String externalNumber;
  final String organizationId;
  final int timestamp;
  final String creationStatus;
  final ErrorInfoEntiti errorInfo;
  final OrdersOrderEntiti order;

  OrderElementEntiti({
    required this.id,
    required this.externalNumber,
    required this.organizationId,
    required this.timestamp,
    required this.creationStatus,
    required this.errorInfo,
    required this.order,
  });
}
