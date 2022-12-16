import 'package:cofee/features/domain/entiti/terminal_group/items_entiti.dart';

class TerminalGroupsEntiti {
  final String organizationId;
  final List<ItemsEntiti> items;

  TerminalGroupsEntiti({
    required this.organizationId,
    required this.items,
  });
}
