import 'package:cofee/features/domain/entiti/order_types/item_entiti.dart';

class ItemModel extends ItemEntiti {
  ItemModel({
    required final String id,
    required final String name,
    required final String orderServiceType,
    required final bool isDeleted,
    required final int externalRevision,
  }) : super(
          id: id,
          name: name,
          orderServiceType: orderServiceType,
          isDeleted: isDeleted,
          externalRevision: externalRevision,
        );
  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["id"] as String,
        name: json["name"] as String,
        orderServiceType: json["orderServiceType"] as String,
        isDeleted: json["isDeleted"] as bool,
        externalRevision: json["externalRevision"] as int,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "orderServiceType": orderServiceType,
        "isDeleted": isDeleted,
        "externalRevision": externalRevision,
      };
}
