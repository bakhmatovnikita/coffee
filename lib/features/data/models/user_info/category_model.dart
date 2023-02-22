import 'package:cofee/features/domain/entiti/user_info/category_entiti.dart';

class CategoryModel extends CategoryEntiti {
  CategoryModel({
    required final String id,
    required final String name,
    required final bool isActive,
    required final bool isDefaultForNewGuests,
  }) : super(
          id: id,
          name: name,
          isActive: isActive,
          isDefaultForNewGuests: isDefaultForNewGuests,
        );
  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        isActive: json["isActive"],
        isDefaultForNewGuests: json["isDefaultForNewGuests"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isActive": isActive,
        "isDefaultForNewGuests": isDefaultForNewGuests,
      };
}
