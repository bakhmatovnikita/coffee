import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BackConstants {
  final storage = const FlutterSecureStorage();
  static const String SERVER_FAILURE_MESSAGE = 'Server Failure';
  static const String CACHED_FAILURE_MESSAGE = 'Cache Failure';
  static const String SAVED_USER_ID = 'SAVED_USER_ID';
  static const String SAVED_TOKEN = 'SAVED_TOKEN';
  static const String SAVED_CARTS_ITEMS = "SAVED_CARTS_ITEMS";
  static const String SAVED_PHONE_USER = 'SAVED_PHONE_USER';
  static const String SAVED_ORGANIZATIONID = "SAVED_ORGANIZATIONID";
  static const String SAVED_TERMINAL_GROUP = "SAVED_TERMINAL_GROUP";
  static const String SAVED_HISTORY_ORDERS = "SAVED_HISTORY_ORDERS";
  static const String baseUrl = 'https://api-ru.iiko.services/api/1/';
  static String token = "";
  static List<CartModel> cart = [];
  static List<CartModel> modalCart = [];
  static List<String> orders = [];
  static int amountPrice = 1;
  static int amountWeight = 1;
  static final List<String> months = [
    '',
    'Января',
    'Фервраля',
    'Марта',
    'Апреля',
    'Мая',
    'Июня',
    'Июля',
    'Августа',
    'Сентября',
    'Октября',
    'Ноября',
    'Декабря',
  ];
  static final List<String> weekDays = [
    '',
    'Пн',
    'Вт',
    'Ср',
    'Чт',
    'Пт',
    'Сб',
    'Вс',
  ];
  static final List<String> weekFullDays = [
    '',
    'Понедельник',
    'Вторник',
    'Среда',
    'Четверг',
    'Пятница',
    'Суббота',
    'Воскресение',
  ];

  static final List<String> weekDaysForMenu = [
    '',
    'Понедельник',
    'Вторник',
    'Среду',
    'Четверг',
    'Пятницу',
    'Субботу',
    'Воскресение',
  ];
  static final List<String> weekDaysForCon = [
    '',
    'в Понедельник',
    'во Вторник',
    'в Среду',
    'в Четверг',
    'в Пятницу',
    'в Субботу',
    'в Воскресение',
  ];
}
