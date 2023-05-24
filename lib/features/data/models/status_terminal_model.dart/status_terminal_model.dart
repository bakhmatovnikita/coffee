import 'package:cofee/features/data/models/status_terminal_model.dart/is_alive_status_model.dart';
import 'package:cofee/features/domain/entiti/status_terminal_entiti/is_alive_status_entiti.dart';
import 'package:cofee/features/domain/entiti/status_terminal_entiti/status_terminal_entiti.dart';

class StatusTerminalModel extends StatusTerminalEntiti{
  StatusTerminalModel({required super.correlationId, required super.isAliveStatus});
  factory StatusTerminalModel.fromJson(Map<String, dynamic> json) => StatusTerminalModel(
        correlationId: json["correlationId"],
        isAliveStatus: List<IsAliveStatusEntiti>.from(json["isAliveStatus"].map((x) => IsAliveStatusModel.fromJson(x))),
    );
}