import 'package:cofee/features/data/models/history/operator_model.dart';
import 'package:cofee/features/domain/entiti/history/courier_info_entiti.dart';

class CourierInfoModel extends CourierInfoEntiti {
  CourierInfoModel({
    required final OperatorModel courier,
    required final bool isCourierSelectedManually,
  }) : super(
          courier: courier,
          isCourierSelectedManually: isCourierSelectedManually,
        );
  factory CourierInfoModel.fromJson(Map<String, dynamic> json) =>
      CourierInfoModel(
        courier: OperatorModel.fromJson(json["courier"]),
        isCourierSelectedManually: json["isCourierSelectedManually"],
      );

  Map<String, dynamic> toJson() => {
        "courier": courier,
        "isCourierSelectedManually": isCourierSelectedManually,
      };
}
