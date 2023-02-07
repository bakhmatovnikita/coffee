import 'package:cofee/features/domain/entiti/select_cart/terminal_group_entiti.dart';

class TerminalGroupModel extends TerminalGroupCartEntiti {
  TerminalGroupModel({
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
  factory TerminalGroupModel.fromJson(Map<String, dynamic> json) =>
      TerminalGroupModel(
        id: json["id"] ?? '',
        organizationId: json["organizationId"] ?? '',
        name: json["name"]??'',
        address: json["address"]??'',
        timeZone: json["timeZone"]??'',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "organizationId": organizationId,
        "name": name,
        "address": address,
        "timeZone": timeZone,
      };
}
