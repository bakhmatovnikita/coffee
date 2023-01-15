import 'package:cofee/features/domain/entiti/history/coordinates_entiti.dart';

class CoordinatesModel extends CoordinatesEntiti {
  CoordinatesModel({
    required final int latitude,
    required final int longitude,
  }) : super(
          latitude: latitude,
          longitude: longitude,
        );
  factory CoordinatesModel.fromJson(Map<String, dynamic> json) => CoordinatesModel(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
