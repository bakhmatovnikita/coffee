import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/features/data/models/terminal_group/terminal_group_model.dart';
import 'package:cofee/features/data/models/user_id_model.dart';

abstract class LocalDatasource {
  Future<UserIdModel> getUserId();
  Future<void> saveUserId(UserIdModel userId);
  Future<String> getToken();
  Future<String> getOrganizatuonId();
  Future<void> saveToken(String token);
  Future<void> savePhoneUser(String phone);
  Future<String> getPhoneUser();
  Future<bool> haveToken();
  Future<bool> haveNumber();
  Future<void> saveToCart(List<CartModel> productModel);
  int getLengthCart();
  List<CartModel> getSavedCart();
  Future<void> delecteCart();
  Future<void> saveOrganizationId(String organizationId);
  Future<void> saveTerminalGroup(TerminalGroupModel terminalGroupModel);
  Future<void> saveHistory(List<String>? orderId);
  Future<void> getUser();
  Future<List<String>> getOrdersId();
  Future<String> getTerminalGroup();
  Future<void> deleteAllOrders();
}
