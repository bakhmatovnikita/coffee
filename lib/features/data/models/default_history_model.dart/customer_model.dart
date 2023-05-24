import 'package:cofee/features/domain/entiti/default_history_entiti.dart/customer_entiti.dart';

class CustomerModel extends CustomerEntiti {
  CustomerModel({
    required super.type,
    required super.id,
    required super.name,
    required super.surname,
    required super.comment,
    required super.gender,
    required super.inBlacklist,
    required super.blacklistReason,
    required super.birthdate,
  });
  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        type: json["type"],
        id: json["id"],
        name: json["name"],
        surname: json["surname"],
        comment: json["comment"],
        gender: json["gender"],
        inBlacklist: json["inBlacklist"],
        blacklistReason: json["blacklistReason"],
        birthdate: json["birthdate"],
      );
}
