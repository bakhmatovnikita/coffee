import 'package:cofee/features/domain/entiti/history/guests_info_entiti.dart';

class GuestsInfoModel extends GuestsInfoEntiti {
  GuestsInfoModel({
    required final int count,
    required final bool splitBetweenPersons,
  }) : super(
          count: count,
          splitBetweenPersons: splitBetweenPersons,
        );
  factory GuestsInfoModel.fromJson(Map<String, dynamic> json) =>
      GuestsInfoModel(
        count: json["count"],
        splitBetweenPersons: json["splitBetweenPersons"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "splitBetweenPersons": splitBetweenPersons,
      };
}
