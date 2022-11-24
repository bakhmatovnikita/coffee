import 'dart:convert';

import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/core/error/exception.dart';
import 'package:cofee/features/auth/presentation/data/datasorces/remote_datasource/remote_datasource.dart';
import 'package:cofee/features/auth/presentation/data/models/organizations_model.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:cofee/features/auth/presentation/data/models/user_id_model.dart';

class RemoteDatasourceImplement implements RemoteDatasource {
  Dio _dio = Dio();
  RemoteDatasourceImplement() {
    _dio = Dio(
      BaseOptions(
        baseUrl: BackConstants.baseUrl,
      ),
    );
    initializeInterceptor();
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
      'Authorization': 'Bearer ${BackConstants.token}',
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
      'Authorization': 'Bearer ${BackConstants.token}',
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
}
