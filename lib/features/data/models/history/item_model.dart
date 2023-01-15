import 'package:cofee/features/data/models/history/combo_information_model.dart';
import 'package:cofee/features/data/models/history/deleted_model.dart';
import 'package:cofee/features/data/models/history/external_courier_service_model.dart';
import 'package:cofee/features/domain/entiti/history/combo_information_entiti.dart';
import 'package:cofee/features/domain/entiti/history/deleted_entiti.dart';
import 'package:cofee/features/domain/entiti/history/external_courier_service_entiti.dart';

import '../../../domain/entiti/history/item_entiti.dart';

class ItemModel extends ItemEntiti {
  ItemModel({
    required final String type,
    required final String status,
    required final DeletedEntiti deleted,
    required final int amount,
    required final String comment,
    required final DateTime whenPrinted,
    required final ExternalCourierServiceEntiti size,
    required final ComboInformationEntiti comboInformation,
  }) : super(
          type: type,
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
        status: json["status"],
        deleted: DeletedModel.fromJson(json["deleted"]),
        amount: json["amount"],
        comment: json["comment"],
        whenPrinted: DateTime.parse(json["whenPrinted"]),
        size: ExternalCourierServiceModel.fromJson(json["size"]),
        comboInformation:
            ComboInformationModel.fromJson(json["comboInformation"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "status": status,
        "deleted": deleted,
        "amount": amount,
        "comment": comment,
        "whenPrinted": whenPrinted.toIso8601String(),
        "size": size,
        "comboInformation": comboInformation,
      };
}
