import 'package:cofee/features/domain/entiti/history/combo_information_entiti.dart';

class ComboInformationModel extends ComboInformationEntiti {
  ComboInformationModel({
    required final String comboId,
    required final String comboSourceId,
    required final String groupId,
  }) : super(
          comboId: comboId,
          comboSourceId: comboSourceId,
          groupId: groupId,
        );
  factory ComboInformationModel.fromJson(Map<String, dynamic> json) =>
      ComboInformationModel(
        comboId: json["comboId"],
        comboSourceId: json["comboSourceId"],
        groupId: json["groupId"],
      );

  Map<String, dynamic> toJson() => {
        "comboId": comboId,
        "comboSourceId": comboSourceId,
        "groupId": groupId,
      };
}
