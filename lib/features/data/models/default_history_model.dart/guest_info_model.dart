

import '../../../domain/entiti/default_history_entiti.dart/guest_info_entiti.dart';

class GuestInfoModel extends GuestInfoEntiti {
  GuestInfoModel({
    required final int count,
    required final bool splitBetweenPersons,
  }) : super(
          count: count,
          splitBetweenPersons: splitBetweenPersons,
        );
  factory GuestInfoModel.fromJson(Map<String, dynamic> json) => GuestInfoModel(
        count: json["count"],
        splitBetweenPersons: json["splitBetweenPersons"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "splitBetweenPersons": splitBetweenPersons,
      };
}
