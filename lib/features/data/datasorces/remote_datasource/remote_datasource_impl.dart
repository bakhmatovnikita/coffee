import 'dart:convert';

import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/core/error/exception.dart';
import 'package:cofee/features/data/datasorces/remote_datasource/remote_datasource.dart';
import 'package:cofee/features/data/models/cart/order_model.dart';
import 'package:cofee/features/data/models/cart_to_order.dart/cart_to_order_model.dart';
import 'package:cofee/features/data/models/history/histroy_model.dart';
import 'package:cofee/features/data/models/organizations_model.dart';
import 'package:cofee/features/data/models/products/products_model.dart';
import 'package:cofee/features/data/models/select_cart/select_cart_model.dart';
import 'package:cofee/features/data/models/terminal_group/terminal_group_model.dart';
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
        "apiLogin": "86a9ec87-8b2",
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
    print('TOKEN IS: ${await storage.read(key: BackConstants.SAVED_TOKEN)}');
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

  @override
  Future<TerminalGroupModel> fetchTerminalGroup(
      String endpoint, String organizationId) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'Authorization':
          'Bearer ${await storage.read(key: BackConstants.SAVED_TOKEN)}',
    };
    final organizationData = jsonEncode({
      "organizationIds": [
        organizationId,
      ]
    });
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
      return TerminalGroupModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<OrderModel> createOrder(String endpoint, List<Item> item, String phone,
      String organizationId, String paymentTypeKind, int sum, String paymentTypeId) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'Authorization':
          'Bearer ${await storage.read(key: BackConstants.SAVED_TOKEN)}',
    };
    final cartToOrderData = jsonEncode({
      "organizationId": organizationId,
      "terminalGroupId": "0bcfb696-b4a3-e489-013e-c7339742007b",
      "order": {
        "phone": phone,
        "items": item,
        "payments": [
          {
            'paymentTypeKind': paymentTypeKind,
            'sum': sum,
            'paymentTypeId': paymentTypeId
          }
        ]
      }
    });
    final response = await _dio.post(
      endpoint,
      data: cartToOrderData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) => status! < 499,
        headers: headers,
      ),
    );
    print(response.statusCode);
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      return OrderModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<HistoryModel> getHistory(
    String endpoint,
    String phone,
    List<String> organizationIds,
  ) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'Authorization':
          'Bearer ${await storage.read(key: BackConstants.SAVED_TOKEN)}',
    };
    final historyOrdersData = jsonEncode({
      "organizationIds": organizationIds,
      "startRevision": 0,
      "phone": phone,
    });
    final response = await _dio.post(
      endpoint,
      data: historyOrdersData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) => status! < 499,
        headers: headers,
      ),
    );
    print(response.statusCode);
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      return HistoryModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<SelectCartModel> getCarts(
      String endpoint, String organizationId) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'Authorization':
          'Bearer ${await storage.read(key: BackConstants.SAVED_TOKEN)}',
    };
    final selectCartData = jsonEncode({
      "organizationIds": [organizationId],
    });
    final response = await _dio.post(
      endpoint,
      data: selectCartData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) => status! < 499,
        headers: headers,
      ),
    );
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      return SelectCartModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
