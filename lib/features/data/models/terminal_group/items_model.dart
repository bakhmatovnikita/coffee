import 'package:cofee/features/domain/entiti/terminal_group/items_entiti.dart';

class ItemsModel extends ItemsEntiti {
  ItemsModel({
    required final String id,
    required final String organizationId,
    required final String name,
    required final String address,
    required final String timeZone,
  }) : super(
          id: id,
          organizationId: organizationId,
          name: name,
          address: address,
          timeZone: timeZone,
        );
  factory ItemsModel.fromJson(Map<String, dynamic> json) => ItemsModel(
        id: json["id"],
        organizationId: json["organizationId"],
        name: json["name"],
        address: json["address"],
        timeZone: json["timeZone"],
      );
      
  Map<String, dynamic> toJson() => {
        "id": id,
        "organizationId": organizationId,
        "name": name,
        "address": address,
        "timeZone": timeZone,
      };
}
