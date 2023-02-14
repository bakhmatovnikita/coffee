import 'package:cofee/features/data/models/cart/order_model.dart';
import 'package:cofee/features/data/models/cart_to_order.dart/cart_to_order_model.dart';
import 'package:cofee/features/data/models/order_types/order_types.dart';
import 'package:cofee/features/data/models/organizations_model.dart';
import 'package:cofee/features/data/models/products/products_model.dart';
import 'package:cofee/features/data/models/select_cart/select_cart_model.dart';
import 'package:cofee/features/data/models/terminal_group/terminal_group_model.dart';
import 'package:cofee/features/data/models/token_model.dart';
import 'package:cofee/features/data/models/user_id_model.dart';

import '../../models/history/histroy_model.dart';

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
  Future<OrderModel> createOrder(String endpoint, List<Item> item, String phone,
      String organizationId, String paymentTypeKind, int sum, String paymentTypeId);
  Future<HistoryModel> getHistory(
      String endpoint, String phone, List<String> organizationIds);
  Future<SelectCartModel> getCarts(String endpoint, String organizationId);
  Future<OrderTypesModel> getOrderTypes(String endpoint, String organizationId);
}
