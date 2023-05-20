

import 'package:cofee/features/data/models/default_history_model.dart/product_model.dart';

import '../../../domain/entiti/default_history_entiti.dart/item_entiti.dart';
import '../../../domain/entiti/default_history_entiti.dart/product_entiti.dart';

class ItemModel extends ItemEntiti {
  ItemModel({
    required final String type,
    required final ProductEntiti product,
    required final dynamic modifiers,
    required final int price,
    required final int cost,
    required final bool pricePredefined,
    required final String positionId,
    required final dynamic taxPercent,
    required final String status,
    required final dynamic deleted,
    required final int amount,
    required final dynamic comment,
    required final dynamic whenPrinted,
    required final dynamic size,
    required final dynamic comboInformation,
  }) : super(
          type: type,
          product: product,
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
        product: ProductModel.fromJson(json["product"]),
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
        whenPrinted: json["whenPrinted"],
        size: json["size"],
        comboInformation: json["comboInformation"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "product": product,
        "modifiers": modifiers,
        "price": price,
        "cost": cost,
        "pricePredefined": pricePredefined,
        "positionId": positionId,
        "taxPercent": taxPercent,
        "status": status,
        "deleted": deleted,
        "amount": amount,
        "comment": comment,
        "whenPrinted": whenPrinted,
        "size": size,
        "comboInformation": comboInformation,
      };
}
