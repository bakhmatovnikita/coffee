import 'dart:convert';

import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/core/error/exception.dart';
import 'package:cofee/features/auth/presentation/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/auth/presentation/data/datasorces/remote_datasource/remote_datasource.dart';
import 'package:cofee/features/auth/presentation/data/models/token_model.dart';
import 'package:cofee/features/auth/presentation/data/models/user_id_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalDatasourceImplement implements LocalDatasource {
  final FlutterSecureStorage storage;
  final RemoteDatasource remoteDatasource;

  LocalDatasourceImplement(this.storage, this.remoteDatasource);
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
    storage.write(
        key: BackConstants.SAVED_TOKEN, value: token);
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
}
