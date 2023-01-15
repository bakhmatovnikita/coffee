import 'package:cofee/features/data/models/history/address_model.dart';
import 'package:cofee/features/data/models/history/coordinates_model.dart';
import 'package:cofee/features/domain/entiti/history/address_entiti.dart';
import 'package:cofee/features/domain/entiti/history/delivery_point_entiti.dart';

import '../../../domain/entiti/history/coordinates_entiti.dart';

class DeliveryPointModel extends DeliveryPointEntiti {
  DeliveryPointModel({
    required final CoordinatesEntiti coordinates,
    required final AddressEntiti address,
    required final String externalCartographyId,
    required final String comment,
  }) : super(
          coordinates: coordinates,
          address: address,
          externalCartographyId: externalCartographyId,
          comment: comment,
        );
  factory DeliveryPointModel.fromJson(Map<String, dynamic> json) =>
      DeliveryPointModel(
        coordinates: CoordinatesModel.fromJson(json["coordinates"]),
        address: AddressModel.fromJson(json["address"]),
        externalCartographyId: json["externalCartographyId"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": coordinates,
        "address": address,
        "externalCartographyId": externalCartographyId,
        "comment": comment,
      };
}
