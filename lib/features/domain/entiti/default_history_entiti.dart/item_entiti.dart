import 'package:cofee/features/domain/entiti/default_history_entiti.dart/dicount_type_entiti.dart';

class ItemEntiti {
  final String type;
  final DiscountTypeEntiti discountType;
  final dynamic modifiers;
  final double price;
  final double cost;
  final bool pricePredefined;
  final String positionId;
  final dynamic taxPercent;
  final String status;
  final dynamic deleted;
  final double amount;
  final dynamic comment;
  final dynamic whenPrinted;
  final dynamic size;
  final dynamic comboInformation;

  ItemEntiti({
    required this.type,
    required this.discountType,
    required this.modifiers,
    required this.price,
    required this.cost,
    required this.pricePredefined,
    required this.positionId,
    required this.taxPercent,
    required this.status,
    required this.deleted,
    required this.amount,
    required this.comment,
    required this.whenPrinted,
    required this.size,
    required this.comboInformation,
  });
}
