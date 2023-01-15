import 'package:cofee/features/data/models/history/external_courier_service_model.dart';
import 'package:cofee/features/domain/entiti/history/cancel_info_entiti.dart';
import 'package:cofee/features/domain/entiti/history/external_courier_service_entiti.dart';

class CancelInfoModel extends CancelInfoEntiti {
  CancelInfoModel({
    required final DateTime whenCancelled,
    required final ExternalCourierServiceEntiti cause,
    required final String comment,
  }) : super(
          whenCancelled: whenCancelled,
          cause: cause,
          comment: comment,
        );
  factory CancelInfoModel.fromJson(Map<String, dynamic> json) =>
      CancelInfoModel(
        whenCancelled: DateTime.parse(json["whenCancelled"]),
        cause: ExternalCourierServiceModel.fromJson(json["cause"]),
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "whenCancelled": whenCancelled.toIso8601String(),
        "cause": cause,
        "comment": comment,
      };
}
