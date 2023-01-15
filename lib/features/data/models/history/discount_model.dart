import 'package:cofee/features/data/models/history/external_courier_service_model.dart';
import 'package:cofee/features/domain/entiti/history/discount_entiti.dart';
import 'package:cofee/features/domain/entiti/history/external_courier_service_entiti.dart';

class DiscountModel extends DiscountEntiti {
  DiscountModel({
    required final ExternalCourierServiceEntiti discountType,
    required final int sum,
    required final List<String> selectivePositions,
  }) : super(
          discountType: discountType,
          sum: sum,
          selectivePositions: selectivePositions,
        );
  factory DiscountModel.fromJson(Map<String, dynamic> json) => DiscountModel(
        discountType:
            ExternalCourierServiceModel.fromJson(json["discountType"]),
        sum: json["sum"],
        selectivePositions:
            List<String>.from(json["selectivePositions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "discountType": discountType,
        "sum": sum,
        "selectivePositions":
            List<dynamic>.from(selectivePositions.map((x) => x)),
      };
}
