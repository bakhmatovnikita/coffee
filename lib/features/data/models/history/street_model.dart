import 'package:cofee/features/data/models/history/external_courier_service_model.dart';

import '../../../domain/entiti/history/street_entiti.dart';

class StreetModel extends StreetEntiti {
  StreetModel({
    required final String id,
    required final String name,
    required final ExternalCourierServiceModel city,
  }) : super(
          id: id,
          name: name,
          city: city,
        );
  factory StreetModel.fromJson(Map<String, dynamic> json) => StreetModel(
        id: json["id"],
        name: json["name"],
        city: ExternalCourierServiceModel.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
      };
}
