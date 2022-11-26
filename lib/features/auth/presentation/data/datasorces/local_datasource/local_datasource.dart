import 'package:cofee/features/auth/presentation/data/models/token_model.dart';
import 'package:cofee/features/auth/presentation/data/models/user_id_model.dart';

abstract class LocalDatasource {
  Future<UserIdModel> getUserId();
  Future<void> saveUserId(UserIdModel userId);
  Future<TokenModel> getToken();
  Future<void> saveToken(String token);
  Future<void> savePhoneUser(String phone);
  Future<String> getPhoneUser();
  Future<bool> haveToken();
  Future<bool> haveNumber();
}
