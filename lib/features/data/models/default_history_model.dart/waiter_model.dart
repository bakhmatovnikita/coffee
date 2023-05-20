import 'package:cofee/features/domain/entiti/default_history_entiti.dart/waiter_entiti.dart';

class WaiterModel extends WaiterEntiti {
  WaiterModel({
    required final String id,
    required final String name,
    required final dynamic phone,
  }) : super(
          id: id,
          name: name,
          phone: phone,
        );
  factory WaiterModel.fromJson(Map<String, dynamic> json) => WaiterModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
      };
}
