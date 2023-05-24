import 'package:cofee/features/domain/entiti/default_history_entiti.dart/dicount_type_entiti.dart';

class DiscountEntiti {
  final DiscountTypeEntiti discountType;
  final double sum;
  final dynamic selectivePositions;

  DiscountEntiti({
    required this.discountType,
    required this.sum,
    required this.selectivePositions,
  });
}
