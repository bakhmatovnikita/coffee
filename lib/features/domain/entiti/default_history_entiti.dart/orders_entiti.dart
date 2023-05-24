

import 'package:cofee/features/domain/entiti/default_history_entiti.dart/order_entiti.dart';

class OrdersEntiti {
  final String id;
  final String? posId;
  final dynamic externalNumber;
  final String organizationId;
  final int timestamp;
  final String creationStatus;
  final dynamic errorInfo;
  final OrderEntiti order;

  OrdersEntiti({
    required this.id,
    required this.posId,
    required this.externalNumber,
    required this.organizationId,
    required this.timestamp,
    required this.creationStatus,
    required this.errorInfo,
    required this.order,
  });
}
