import 'package:cofee/features/data/models/default_history_model.dart/discount_type_model.dart';
import 'package:cofee/features/domain/entiti/default_history_entiti.dart/discount_entiti.dart';

class DiscountModel extends DiscountEntiti {
  DiscountModel({
    required super.discountType,
    required super.sum,
    required super.selectivePositions,
  });
  factory DiscountModel.fromJson(Map<String, dynamic> json) => DiscountModel(
        discountType: DiscountTypeModel.fromJson(json["discountType"]),
        sum: json["sum"]?.toDouble(),
        selectivePositions: json["selectivePositions"],
      );
}
