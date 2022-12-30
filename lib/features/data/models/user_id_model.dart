import 'package:cofee/features/domain/entiti/user_id_entiti.dart';

class UserIdModel extends UserIdEntiti {
  UserIdModel({
    required final String id,
  }) : super(id: id);
  factory UserIdModel.fromJson(Map<String, dynamic> json) => UserIdModel(
        id: json['id'],
      );
  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
