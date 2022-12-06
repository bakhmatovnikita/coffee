import 'dart:convert';

import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/core/error/exception.dart';
import 'package:cofee/features/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/data/datasorces/remote_datasource/remote_datasource.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/features/data/models/token_model.dart';
import 'package:cofee/features/data/models/user_id_model.dart';
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
  Future<TokenModel> getToken() async {
    final token = await storage.read(key: BackConstants.SAVED_TOKEN);
    if (token != null) {
      return TokenModel.fromJson(jsonDecode(token));
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
    storage.write(key: BackConstants.SAVED_PHONE_USER, value: phone);
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
}
