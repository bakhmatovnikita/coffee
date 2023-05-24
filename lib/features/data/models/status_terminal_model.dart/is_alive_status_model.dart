import 'package:cofee/features/domain/entiti/status_terminal_entiti/is_alive_status_entiti.dart';

class IsAliveStatusModel extends IsAliveStatusEntiti {
  IsAliveStatusModel({
    required super.isAlive,
    required super.terminalGroupId,
    required super.organizationId,
  });
  factory IsAliveStatusModel.fromJson(Map<String, dynamic> json) =>
      IsAliveStatusModel(
        isAlive: json["isAlive"],
        terminalGroupId: json["terminalGroupId"],
        organizationId: json["organizationId"],
      );
}
