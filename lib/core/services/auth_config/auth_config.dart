import 'package:cofee/features/data/models/user_id_model.dart';

class AuthConfig {
  String? loginToken;
  UserIdModel? userId;
  AuthConfig(
    {this.loginToken,
    this.userId,}
  );
}
