import 'package:cofee/features/data/models/cart/order_model.dart';
import 'package:cofee/features/data/models/cart_to_order.dart/cart_to_order_model.dart';
import 'package:cofee/features/data/models/default_history_model.dart/history_order_model.dart';
import 'package:cofee/features/data/models/order_types/order_types.dart';
import 'package:cofee/features/data/models/organizations_model.dart';
import 'package:cofee/features/data/models/products/products_model.dart';
import 'package:cofee/features/data/models/select_cart/select_cart_model.dart';
import 'package:cofee/features/data/models/sms_model/sms_model.dart';
import 'package:cofee/features/data/models/status_terminal_model.dart/status_terminal_model.dart';
import 'package:cofee/features/data/models/terminal_group/terminal_group_model.dart';
import 'package:cofee/features/data/models/token_model.dart';
import 'package:cofee/features/data/models/user_id_model.dart';
import 'package:cofee/features/domain/entiti/user_info/user_info_entiti.dart';
import 'package:dio/dio.dart';

abstract class RemoteDatasource {
  Future<UserIdModel> createUser(
      String endpoint, String phoneNumber, String organizationId, [String? email, String? name]);
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
  Future<HistoryOrderModel> getHistory(String endpoint, List<String> organizationIds, List<String> ordersId);
  Future<SelectCartModel> getCarts(String endpoint, String organizationId);
  Future<OrderTypesModel> getOrderTypes(String endpoint, String organizationId);
  Future<dynamic> fetch(RequestOptions options);
  Future<UserInfoEntiti> getUserInfo(String phone, String organizationId);
  Future<StatusTerminalModel> getStatusTerminal(String organizationId, String terminalGroupId);
  Future<SmsModel>sendMessage(String phone, String msg);
}
