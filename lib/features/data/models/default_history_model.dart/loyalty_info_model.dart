import 'package:cofee/features/domain/entiti/default_history_entiti.dart/loyalty_info_entiti.dart';

class LoyaltyInfoModel extends LoyaltyInfoEntiti {
  LoyaltyInfoModel({
    required final dynamic coupon,
    required final dynamic appliedManualConditions,
  }) : super(
          coupon: coupon,
          appliedManualConditions: appliedManualConditions,
        );
  factory LoyaltyInfoModel.fromJson(Map<String, dynamic> json) =>
      LoyaltyInfoModel(
        coupon: json["coupon"],
        appliedManualConditions: json["appliedManualConditions"],
      );

  Map<String, dynamic> toJson() => {
        "coupon": coupon,
        "appliedManualConditions": appliedManualConditions,
      };
}
