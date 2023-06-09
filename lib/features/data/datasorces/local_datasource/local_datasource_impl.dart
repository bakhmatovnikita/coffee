import 'dart:convert';

import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/core/error/exception.dart';
import 'package:cofee/core/services/auth_config/auth_config.dart';
import 'package:cofee/features/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/data/datasorces/remote_datasource/remote_datasource.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/features/data/models/terminal_group/terminal_group_model.dart';
import 'package:cofee/features/data/models/user_id_model.dart';
import 'package:cofee/injection.container.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatasourceImplement implements LocalDatasource {
  final FlutterSecureStorage storage;
  final RemoteDatasource remoteDatasource;
  final SharedPreferences sharedPreferences;

  LocalDatasourceImplement(
      this.storage, this.remoteDatasource, this.sharedPreferences);
  @override
  Future<UserIdModel> getUserId() async {
    final userId = await storage.read(key: BackConstants.SAVED_USER_ID);
    if (userId != null) {
      return UserIdModel.fromJson(jsonDecode(userId));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveUserId(UserIdModel userId) async {
    storage.write(
        key: BackConstants.SAVED_USER_ID, value: jsonEncode(userId.toJson()));
  }

  @override
  Future<String> getToken() async {
    final token = await storage.read(key: BackConstants.SAVED_TOKEN);
    if (token != null) {
      return token;
    } else if (token == null) {
      return "";
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveToken(String token) async {
    storage.write(key: BackConstants.SAVED_TOKEN, value: token);
  }

  @override
  Future<String> getPhoneUser() async {
    final phoneUser = await storage.read(key: BackConstants.SAVED_PHONE_USER);
    if (phoneUser != null) {
      return phoneUser;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> savePhoneUser(String phone) async {
    await storage.write(key: BackConstants.SAVED_PHONE_USER, value: phone);
  }

  @override
  Future<bool> haveNumber() async {
    final phone = await storage.read(key: BackConstants.SAVED_PHONE_USER);
    if (phone != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> haveToken() async {
    final token = await storage.read(key: BackConstants.SAVED_TOKEN);
    final oldToken = await remoteDatasource.getToken("access_token");
    if (token == oldToken.toString()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> saveToCart(List<CartModel> cartModel) {
    final List<String> cartModelList =
        cartModel.map((product) => json.encode(product.toJson())).toList();
    return sharedPreferences.setStringList(
        BackConstants.SAVED_CARTS_ITEMS, cartModelList);
  }

  @override
  int getLengthCart() {
    return sharedPreferences
        .getStringList(BackConstants.SAVED_CARTS_ITEMS)!
        .length;
  }

  @override
  List<CartModel> getSavedCart() {
    final jsonCartList =
        sharedPreferences.getStringList(BackConstants.SAVED_CARTS_ITEMS);
    if (jsonCartList != null) {
      print(jsonCartList);
      return jsonCartList
          .map((cart) => CartModel.fromJson(json.decode(cart)))
          .toList();
    } else if (jsonCartList == null) {
      return [];
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> delecteCart() async {
    try {
      sharedPreferences.remove(BackConstants.SAVED_CARTS_ITEMS);
      BackConstants.cart.clear();
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> saveOrganizationId(String organizationId) async {
    storage.write(
        key: BackConstants.SAVED_ORGANIZATIONID, value: organizationId);
  }

  @override
  Future<void> saveTerminalGroup(TerminalGroupModel terminalGroupModel) async {
    final String terminalGroup =
        terminalGroupModel.terminalGroups[0].items[0].id;
    print(terminalGroup);
    sharedPreferences.setString(
        BackConstants.SAVED_TERMINAL_GROUP, terminalGroup);
  }

  @override
  Future<String> getOrganizatuonId() async {
    final organizationId =
        await storage.read(key: BackConstants.SAVED_ORGANIZATIONID);
    if (organizationId != null) {
      return organizationId;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveHistory(List<String>? ordersId) async {
    await sharedPreferences.setStringList(
        BackConstants.SAVED_HISTORY_ORDERS, ordersId!);
  }

  @override
  Future<void> getUser() async {
    sl<AuthConfig>().phoneUser =
        sharedPreferences.getString(BackConstants.SAVED_PHONE_USER);
  }

  @override
  Future<List<String>> getOrdersId() async {
    final list =
        sharedPreferences.getStringList(BackConstants.SAVED_HISTORY_ORDERS);
    if (list != null) {
      return list;
    }
    return [];
  }

  @override
  Future<String> getTerminalGroup() async {
    final data =
        sharedPreferences.getString(BackConstants.SAVED_TERMINAL_GROUP);
    if (data != null) {
      return data;
    }
    return '';
  }

  @override
  Future<void> deleteAllOrders() async {
    sharedPreferences.remove(BackConstants.SAVED_HISTORY_ORDERS);
  }

  @override
  Future<void> saveOrderTypeId(int id) async {
    sharedPreferences.setInt(BackConstants.SAVED_ORDER_TYPE_ID, id);
  }

  @override
  Future<void> saveOrderType(String orderId) async {
    sharedPreferences.setString(BackConstants.SAVED_ORDER_TYPE, orderId);
  }

  @override
  Future<String> getOrderType() async {
    final data = sharedPreferences.getString(BackConstants.SAVED_ORDER_TYPE);
    if (data != null) {
      return data;
    }
    return '';
  }

  @override
  Future<int> getOrderTypeId() async {
    final data = sharedPreferences.getInt(BackConstants.SAVED_ORDER_TYPE_ID);
    if (data != null) {
      return data;
    }
    return 0;
  }
  // @override
  // Future<void> saveToCart(List<CartModel> cartModel) {
  //   final List<String> cartModelList =
  //       cartModel.map((product) => json.encode(product.toJson())).toList();
  //   return sharedPreferences.setStringList(
  //       BackConstants.SAVED_CARTS_ITEMS, cartModelList);
  // }
}
