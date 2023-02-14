class ItemEntiti {
  final String id;
  final String name;
  final String orderServiceType;
  final bool isDeleted;
  final int externalRevision;

  ItemEntiti({
    required this.id,
    required this.name,
    required this.orderServiceType,
    required this.isDeleted,
    required this.externalRevision,
  });
}
