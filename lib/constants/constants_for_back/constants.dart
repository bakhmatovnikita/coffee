import 'package:cofee/core/services/auth_config/auth_config.dart';
import 'package:cofee/injection.container.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BackConstants {
  final storage = const FlutterSecureStorage();
  static const String SERVER_FAILURE_MESSAGE = 'Server Failure';
  static const String CACHED_FAILURE_MESSAGE = 'Cache Failure';
  static const String SAVED_USER_ID = 'SAVED_USER_ID';
  static const String SAVED_TOKEN = 'SAVED_TOKEN';
  static const String SAVED_PHONE_USER = 'SAVED_PHONE_USER';
  static const String baseUrl = 'https://api-ru.iiko.services/api/1/';
  static String token = ""; 
}
