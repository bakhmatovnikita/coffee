import 'package:cofee/features/data/models/history/deletion_method_model.dart';
import 'package:cofee/features/domain/entiti/history/deleted_entiti.dart';
import 'package:cofee/features/domain/entiti/history/deletion_method_entiti.dart';

class DeletedModel extends DeletedEntiti {
  DeletedModel({
    required final DeletionMethodEntiti deletionMethod,
  }) : super(
          deletionMethod: deletionMethod,
        );
  factory DeletedModel.fromJson(Map<String, dynamic> json) => DeletedModel(
        deletionMethod: DeletionMethodModel.fromJson(json["deletionMethod"]),
      );

  Map<String, dynamic> toJson() => {
        "deletionMethod": deletionMethod,
      };
}
