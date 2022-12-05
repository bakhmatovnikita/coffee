
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/features/data/models/token_model.dart';
import 'package:cofee/features/data/models/user_id_model.dart';

abstract class LocalDatasource {
  Future<UserIdModel> getUserId();
  Future<void> saveUserId(UserIdModel userId);
  Future<TokenModel> getToken();
  Future<void> saveToken(String token);
  Future<void> savePhoneUser(String phone);
  Future<String> getPhoneUser();
  Future<bool> haveToken();
  Future<bool> haveNumber();
  Future<void> saveToCart(List<CartModel> productModel);
  int getLengthCart();
  List<CartModel> getSavedCart();
  Future<void> delecteCart();
}
