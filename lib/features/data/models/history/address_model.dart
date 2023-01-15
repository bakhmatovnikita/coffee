import 'package:cofee/features/data/models/history/external_courier_service_model.dart';
import 'package:cofee/features/data/models/history/street_model.dart';
import 'package:cofee/features/domain/entiti/history/address_entiti.dart';

class AddressModel extends AddressEntiti {
  AddressModel({
    required final StreetModel street,
    required final String index,
    required final String house,
    required final String building,
    required final String flat,
    required final String entrance,
    required final String floor,
    required final String doorphone,
    required final ExternalCourierServiceModel region,
  }) : super(
          street: street,
          index: index,
          house: house,
          building: building,
          flat: flat,
          entrance: entrance,
          floor: floor,
          doorphone: doorphone,
          region: region,
        );
  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        street: StreetModel.fromJson(json["street"]),
        index: json["index"],
        house: json["house"],
        building: json["building"],
        flat: json["flat"],
        entrance: json["entrance"],
        floor: json["floor"],
        doorphone: json["doorphone"],
        region: ExternalCourierServiceModel.fromJson(json["region"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "index": index,
        "house": house,
        "building": building,
        "flat": flat,
        "entrance": entrance,
        "floor": floor,
        "doorphone": doorphone,
        "region": region,
      };
}
