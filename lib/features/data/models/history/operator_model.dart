import 'package:cofee/features/domain/entiti/history/operator_entiti.dart';

class OperatorModel extends OperatorEntiti {
  OperatorModel({
    required final String id,
    required final String name,
    required final String phone,
  }) : super(
          id: id,
          name: name,
          phone: phone,
        );
  factory OperatorModel.fromJson(Map<String, dynamic> json) => OperatorModel(
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
