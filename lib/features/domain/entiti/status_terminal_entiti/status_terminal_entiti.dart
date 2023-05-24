import 'package:cofee/features/domain/entiti/status_terminal_entiti/is_alive_status_entiti.dart';

class StatusTerminalEntiti {
  final String correlationId;
  final List<IsAliveStatusEntiti> isAliveStatus;

  StatusTerminalEntiti({
    required this.correlationId,
    required this.isAliveStatus,
  });
}
