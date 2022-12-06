import 'dart:convert';

import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/core/error/exception.dart';
import 'package:cofee/features/data/datasorces/remote_datasource/remote_datasource.dart';
import 'package:cofee/features/data/models/organizations_model.dart';
import 'package:cofee/features/data/models/products/products_model.dart';
import 'package:cofee/features/data/models/token_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:cofee/features/data/models/user_id_model.dart';

class RemoteDatasourceImplement implements RemoteDatasource {
  Dio _dio = Dio();
  final storage = const FlutterSecureStorage();
  RemoteDatasourceImplement() {
    _dio = Dio(
      BaseOptions(
        baseUrl: BackConstants.baseUrl,
      ),
    );
    // initializeInterceptor();
  }
  initializeInterceptor() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  @override
  Future<UserIdModel> createUser(
      String endpoint, String phone, String organizationId) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'Authorization':
          'Bearer ${await storage.read(key: BackConstants.SAVED_TOKEN)}',
    };
    final userData = jsonEncode({
      "organizationId": organizationId,
      "phone": phone,
    });
    final response = await _dio.post(
      endpoint,
      data: userData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) => status! < 499,
        headers: headers,
      ),
    );
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      return UserIdModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<OrganizationsModel> getOrganizations(List<String> organizationIds,
      bool returnAdditionalInfo, bool includeDisabled, String endpoint) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'Authorization':
          'Bearer ${await storage.read(key: BackConstants.SAVED_TOKEN)}',
    };
    final organizationData = jsonEncode(
      {
        "organizationIds": organizationIds,
        "returnAdditionalInfo": true,
        "includeDisabled": true
      },
    );
    final response = await _dio.post(
      endpoint,
      data: organizationData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) => status! < 499,
        headers: headers,
      ),
    );
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      return OrganizationsModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TokenModel> getToken(String endpoint) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    final apiLoginData = jsonEncode(
      {
        "apiLogin": "4bbdab74-a27",
        "returnAdditionalInfo": true,
        "includeDisabled": true
      },
    );
    final response = await _dio.post(
      endpoint,
      data: apiLoginData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) => status! < 499,
        headers: headers,
      ),
    );
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      return TokenModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductsModel> getProducts(String endpoint) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'Authorization':
          'Bearer ${await storage.read(key: BackConstants.SAVED_TOKEN)}',
    };
    final organizationIdData = jsonEncode({
      "organizationId": "aaf34eae-ad9d-4ea0-8dfb-5ad02d23a0b8",
      "startRevision": 0
    });
    final response = await _dio.post(
      endpoint,
      data: organizationIdData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) => status! < 499,
        headers: headers,
      ),
    );
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      return ProductsModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
