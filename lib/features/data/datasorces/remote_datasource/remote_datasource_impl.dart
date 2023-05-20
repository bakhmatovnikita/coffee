import 'dart:convert';

import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/features/data/datasorces/remote_datasource/auth_interceptor.dart';
import 'package:cofee/features/data/datasorces/remote_datasource/remote_datasource.dart';
import 'package:cofee/features/data/models/cart/order_model.dart';
import 'package:cofee/features/data/models/cart_to_order.dart/cart_to_order_model.dart';
import 'package:cofee/features/data/models/default_history_model.dart/history_order_model.dart';
import 'package:cofee/features/data/models/order_types/order_types.dart';
import 'package:cofee/features/data/models/organizations_model.dart';
import 'package:cofee/features/data/models/products/products_model.dart';
import 'package:cofee/features/data/models/select_cart/select_cart_model.dart';
import 'package:cofee/features/data/models/terminal_group/terminal_group_model.dart';
import 'package:cofee/features/data/models/token_model.dart';
import 'package:cofee/features/data/models/user_id_model.dart';
import 'package:cofee/features/data/models/user_info/user_info_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RemoteDatasourceImplement implements RemoteDatasource {
  Dio _dio = Dio();
  final storage = const FlutterSecureStorage();

  RemoteDatasourceImplement() {
    _dio = Dio(
      BaseOptions(
        baseUrl: BackConstants.baseUrl,
      ),
    );
    initializeInterceptor();
  }
  initializeInterceptor() {
    _dio.interceptors.add(DataSourceInterceptor());
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };
  @override
  Future<UserIdModel> createUser(
      String endpoint, String phone, String organizationId) async {
    final userData = jsonEncode({
      "organizationId": organizationId,
      "phone": phone,
    });
    try {
      final response = await _dio.post(
        endpoint,
        data: userData,
        options: Options(
          followRedirects: false,
        ),
      );
      return UserIdModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  @override
  Future<OrganizationsModel> getOrganizations(List<String> organizationIds,
      bool returnAdditionalInfo, bool includeDisabled, String endpoint) async {
    final organizationData = jsonEncode(
      {
        "organizationIds": organizationIds,
        "returnAdditionalInfo": true,
        "includeDisabled": true
      },
    );
    try {
      final response = await _dio.post(
        endpoint,
        data: organizationData,
        options: Options(
          headers: headers,
        ),
      );
      return OrganizationsModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  @override
  Future<TokenModel> getToken(String endpoint) async {
    final apiLoginData = jsonEncode(
      {
        "apiLogin": "86a9ec87-8b2",
        "returnAdditionalInfo": true,
        "includeDisabled": true
      },
    );
    try {
      final response = await _dio.post(
        endpoint,
        data: apiLoginData,
      );
      return TokenModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  @override
  Future<ProductsModel> getProducts(String endpoint) async {
    final organizationIdData = jsonEncode({
      "organizationId": "aaf34eae-ad9d-4ea0-8dfb-5ad02d23a0b8",
      "startRevision": 0
    });
    try {
      final response = await _dio.post(
        endpoint,
        data: organizationIdData,
      );
      return ProductsModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  @override
  Future<TerminalGroupModel> fetchTerminalGroup(
      String endpoint, String organizationId) async {
    final organizationData = jsonEncode({
      "organizationIds": [
        organizationId,
      ]
    });
    try {
      final response = await _dio.post(
        endpoint,
        data: organizationData,
        options: Options(
          followRedirects: false,
        ),
      );

      return TerminalGroupModel.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<OrderModel> createOrder(
      String endpoint,
      List<Item> item,
      String phone,
      String organizationId,
      String paymentTypeKind,
      int sum,
      String paymentTypeId) async {
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
        ],
        "createOrderSettings": {
          "mode": "Async",
        },
      }
    });
    try {
      final response = await _dio.post(
        endpoint,
        data: cartToOrderData,
        options: Options(
          followRedirects: false,
        ),
      );
      print(response.statusCode);
      print(response.data);

      return OrderModel.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<HistoryOrderModel> getHistory(
    String endpoint,
    List<String> organizationIds,
    List<String> ordersId,
  ) async {
    final historyOrdersData = jsonEncode({
      "organizationIds": organizationIds,
      "orderIds": ordersId,
    });
    try {
      final response = await _dio.post(
        endpoint,
        data: historyOrdersData,
        options: Options(
          followRedirects: false,
        ),
      );
      print(response.statusCode);
      print(response.data);
      return HistoryOrderModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  @override
  Future<SelectCartModel> getCarts(
      String endpoint, String organizationId) async {
    final selectCartData = jsonEncode({
      "organizationIds": [organizationId],
    });
    try {
      final response = await _dio.post(
        endpoint,
        data: selectCartData,
        options: Options(
          followRedirects: false,
        ),
      );
      return SelectCartModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  @override
  Future<OrderTypesModel> getOrderTypes(
      String endpoint, String organizationId) async {
    final selectOrderTypeData = jsonEncode({
      "organizationIds": [organizationId],
    });
    try {
      final response = await _dio.post(
        endpoint,
        data: selectOrderTypeData,
        options: Options(
          followRedirects: false,
        ),
      );
      return OrderTypesModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserInfoModel> getUserInfo(
      String endpoint, String phone, String organizationId) async {
    final userInfoData = jsonEncode({
      {
        "phone": phone,
        "type": "phone",
        "organizationId": organizationId,
      }
    });
    try {
      final response = await _dio.post(
        endpoint,
        data: userInfoData,
      );
      return UserInfoModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  @override
  Future fetch(RequestOptions options) {
    try {
      return _dio.fetch(options);
    } catch (_) {
      rethrow;
    }
  }
}
