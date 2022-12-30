import 'package:cofee/features/domain/entiti/terminal_group/terminal_groups_entiti.dart';

class TerminalGroupEntiti {
  final String correlationId;
  final List<TerminalGroupsEntiti> terminalGroups;

  TerminalGroupEntiti({
    required this.correlationId,
    required this.terminalGroups,
  });
}
