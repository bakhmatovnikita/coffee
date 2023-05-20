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
import 'package:dio/dio.dart';

import '../../models/user_info/user_info_model.dart';

abstract class RemoteDatasource {
  Future<UserIdModel> createUser(
      String endpoint, String phoneNumber, String organizationId);
  Future<OrganizationsModel> getOrganizations(
    List<String> organizationIds,
    bool returnAdditionalInfo,
    bool includeDisabled,
    String endpoint,
  );
  Future<TokenModel> getToken(String endpoint);
  Future<ProductsModel> getProducts(String endpoint);
  Future<TerminalGroupModel> fetchTerminalGroup(
      String endpoint, String organizationId);
  Future<OrderModel> createOrder(
      String endpoint,
      List<Item> item,
      String phone,
      String organizationId,
      String paymentTypeKind,
      int sum,
      String paymentTypeId);
  Future<HistoryOrderModel> getHistory(
      String endpoint, List<String> organizationIds, List<String> ordersId);
  Future<SelectCartModel> getCarts(String endpoint, String organizationId);
  Future<OrderTypesModel> getOrderTypes(String endpoint, String organizationId);
  Future<UserInfoModel> getUserInfo(
      String endpoint, String phone, String organizationId);
  Future<dynamic> fetch(RequestOptions options);
}
