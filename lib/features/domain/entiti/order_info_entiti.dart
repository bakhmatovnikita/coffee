class OrderInfoEntiti {
  final String id;
  final dynamic posId;
  final dynamic externalNumber;
  final String organizationId;
  final int timestamp;
  final String creationStatus;
  final dynamic errorInfo;
  final dynamic order;

  OrderInfoEntiti({
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
