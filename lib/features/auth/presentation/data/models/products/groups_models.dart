import 'package:cofee/features/auth/presentation/domain/entiti/products/groups_entiti.dart';

class GroupsModels extends GroupsEntiti {
  GroupsModels({
    required final String name,
    required final String id,
  }) : super(
          name: name,
          id: id,
        );
  factory GroupsModels.fromJson(Map<String, dynamic> json) => GroupsModels(
        name: json['name'],
        id: json['id'],
      );
}
