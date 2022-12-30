import 'package:cofee/features/data/models/terminal_group/items_model.dart';
import 'package:cofee/features/domain/entiti/terminal_group/items_entiti.dart';
import 'package:cofee/features/domain/entiti/terminal_group/terminal_groups_entiti.dart';

class TerminalGroupsModel extends TerminalGroupsEntiti {
  TerminalGroupsModel({
    required final String organizationId,
    required final List<ItemsEntiti> items,
  }) : super(
          organizationId: organizationId,
          items: items,
        );
  factory TerminalGroupsModel.fromJson(Map<String, dynamic> json) =>
      TerminalGroupsModel(
        organizationId: json["organizationId"],
        items: List<ItemsModel>.from(
            json["items"].map((x) => ItemsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "organizationId": organizationId,
        'items': items,
      };
}
