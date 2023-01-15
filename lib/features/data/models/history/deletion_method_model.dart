import 'package:cofee/features/data/models/history/external_courier_service_model.dart';
import 'package:cofee/features/domain/entiti/history/deletion_method_entiti.dart';
import 'package:cofee/features/domain/entiti/history/external_courier_service_entiti.dart';

class DeletionMethodModel extends DeletionMethodEntiti {
  DeletionMethodModel({
    required final String id,
    required final String comment,
    required final ExternalCourierServiceEntiti removalType,
  }) : super(
          id: id,
          comment: comment,
          removalType: removalType,
        );
  factory DeletionMethodModel.fromJson(Map<String, dynamic> json) =>
      DeletionMethodModel(
        id: json["id"],
        comment: json["comment"],
        removalType: ExternalCourierServiceModel.fromJson(json["removalType"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "removalType": removalType,
      };
}
