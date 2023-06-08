import 'package:cofee/features/data/models/user_id_model.dart';

class AuthConfig {
  String? loginToken;
  String? phoneUser;
  String? nameUser;
  String? email;
  String? orderType;
  int? orderTypeId;
  UserIdModel? userId;
  int? bonus;
  AuthConfig({
    this.loginToken,
    this.userId,
    this.phoneUser,
    this.bonus,
    this.email,
    this.nameUser,
    this.orderType,
    this.orderTypeId,
  });
}
