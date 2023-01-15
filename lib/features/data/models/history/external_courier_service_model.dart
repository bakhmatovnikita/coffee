import 'package:cofee/features/domain/entiti/history/external_courier_service_entiti.dart';

class ExternalCourierServiceModel extends ExternalCourierServiceEntiti {
  ExternalCourierServiceModel({
    required final String id,
    required final String name,
  }) : super(
          id: id,
          name: name,
        );
  factory ExternalCourierServiceModel.fromJson(Map<String, dynamic> json) =>
      ExternalCourierServiceModel(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
