import 'package:cofee/features/domain/entiti/history/conception_entiti.dart';

class ConceptionModel extends ConceptionEntiti {
  ConceptionModel({
    required final String id,
    required final String name,
    required final String code,
  }) : super(
          id: id,
          name: name,
          code: code,
        );
  factory ConceptionModel.fromJson(Map<String, dynamic> json) =>
      ConceptionModel(
        id: json["id"],
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
      };
}
