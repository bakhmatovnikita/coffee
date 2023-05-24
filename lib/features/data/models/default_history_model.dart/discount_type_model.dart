import 'package:cofee/features/domain/entiti/default_history_entiti.dart/dicount_type_entiti.dart';

class DiscountTypeModel extends DiscountTypeEntiti {
  DiscountTypeModel({required super.id, required super.name});
  factory DiscountTypeModel.fromJson(Map<String, dynamic> json) =>
      DiscountTypeModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
