

import 'package:cofee/features/data/models/default_history_model.dart/discount_type_model.dart';
import 'package:cofee/features/domain/entiti/default_history_entiti.dart/dicount_type_entiti.dart';

import '../../../domain/entiti/default_history_entiti.dart/item_entiti.dart';

class ItemModel extends ItemEntiti {
  ItemModel({
    required final String type,
    required final DiscountTypeEntiti discountType,
    required final dynamic modifiers,
    required final double price,
    required final double cost,
    required final bool pricePredefined,
    required final String positionId,
    required final dynamic taxPercent,
    required final String status,
    required final dynamic deleted,
    required final double amount,
    required final dynamic comment,
    required final DateTime? whenPrinted,
    required final dynamic size,
    required final dynamic comboInformation,
  }) : super(
          type: type,
          discountType: discountType,
          modifiers: modifiers,
          price: price,
          cost: cost,
          pricePredefined: pricePredefined,
          positionId: positionId,
          taxPercent: taxPercent,
          status: status,
          deleted: deleted,
          amount: amount,
          comment: comment,
          whenPrinted: whenPrinted,
          size: size,
          comboInformation: comboInformation,
        );
  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        type: json["type"],
        discountType: DiscountTypeModel.fromJson(json["product"]),
        modifiers: json["modifiers"],
        price: json["price"],
        cost: json["cost"],
        pricePredefined: json["pricePredefined"],
        positionId: json["positionId"],
        taxPercent: json["taxPercent"],
        status: json["status"],
        deleted: json["deleted"],
        amount: json["amount"],
        comment: json["comment"],
        whenPrinted: json["whenPrinted"] == null ? null : DateTime.parse(json["whenPrinted"]),
        size: json["size"],
        comboInformation: json["comboInformation"],
      );

  // Map<String, dynamic> toJson() => {
  //       "type": type,
  //       "product": product,
  //       "modifiers": modifiers,
  //       "price": price,
  //       "cost": cost,
  //       "pricePredefined": pricePredefined,
  //       "positionId": positionId,
  //       "taxPercent": taxPercent,
  //       "status": status,
  //       "deleted": deleted,
  //       "amount": amount,
  //       "comment": comment,
  //       "whenPrinted": whenPrinted,
  //       "size": size,
  //       "comboInformation": comboInformation,
  //     };
}
