import 'package:cofee/features/domain/entiti/terminal_group/terminal_group_entiti.dart';
import 'package:cofee/features/domain/entiti/terminal_group/terminal_groups_entiti.dart';

import 'terminal_groups_model.dart';

class TerminalGroupModel extends TerminalGroupEntiti {
  TerminalGroupModel({
    required final String correlationId,
    required final List<TerminalGroupsEntiti> terminalGroups,
  }) : super(
          correlationId: correlationId,
          terminalGroups: terminalGroups,
        );
  factory TerminalGroupModel.fromJson(Map<String, dynamic> json) =>
      TerminalGroupModel(
        correlationId: json["correlationId"] ?? '',
        terminalGroups: List<TerminalGroupsModel>.from(
          (json["terminalGroups"] as List<dynamic>)
              .map((x) => TerminalGroupsModel.fromJson(x))
              .toList(), 
        ) 
      );

  Map<String, dynamic> toJson() => {
        "correlationId": correlationId,
        "terminalGroups": terminalGroups,
      };
}
