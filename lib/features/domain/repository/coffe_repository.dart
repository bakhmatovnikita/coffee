import 'package:cofee/core/error/failure.dart';
import 'package:cofee/features/data/models/cart/order_model.dart';
import 'package:cofee/features/data/models/cart_to_order.dart/cart_to_order_model.dart';
import 'package:cofee/features/data/models/order_types/order_types.dart';
import 'package:cofee/features/data/models/select_cart/select_cart_model.dart';
import 'package:cofee/features/data/models/sms_model/sms_model.dart';
import 'package:cofee/features/domain/entiti/default_history_entiti.dart/history_order_entiti.dart';
import 'package:cofee/features/domain/entiti/products/products_entiti.dart';
import 'package:cofee/features/domain/entiti/status_terminal_entiti/status_terminal_entiti.dart';
import 'package:cofee/features/domain/entiti/terminal_group/terminal_group_entiti.dart';
import 'package:cofee/features/domain/entiti/token_entiti.dart';
import 'package:cofee/features/domain/entiti/user_id_entiti.dart';
import 'package:cofee/features/domain/entiti/user_info/user_info_entiti.dart';
import 'package:dartz/dartz.dart';

import '../entiti/organizations_entiti.dart';

abstract class CoffeeRepository {
  Future<Either<Failure, UserIdEntiti>> createUser(
      String endpoint, String phone, String organizationId, [String? email, String? name]);
  Future<Either<Failure, OrganizationsEntiti>> getOrganization(
    List<String> organizationIds,
    bool returnAdditionalInfo,
    bool includeDisabled,
    String endpoint,
  );
  Future<Either<Failure, TokenEntiti>> getToken(String endpoint);
  Future<Either<Failure, ProductsEntiti>> getProducts(String endpoint);
  Future<Either<Failure, TerminalGroupEntiti>> getTerminalGroup(
      String endpoint, String organizationId);
  Future<Either<Failure, OrderModel>> createOrder(
      String endpoint,
      List<Item> item,
      String phone,
      String organizationId,
      String paymentTypeKind,
      int sum,
      String paymentTypeId);
  Future<Either<Failure, HistoryOrderEntiti>> getOrderHistory(
      String endpoint, List<String> organizationIds, List<String> ordersId);
  Future<Either<Failure, SelectCartModel>> getCart(
      String endpoint, String organizationId);
  Future<Either<Failure, OrderTypesModel>> getOrderTypes(
      String endpoint, String organizationId);
  Future<Either<Failure, UserInfoEntiti>> getUserInfo();
  Future<Either<Failure, StatusTerminalEntiti>> getStatusTerminal(String organizationId, String terminalGroupId);
  Future<Either<Failure, SmsModel>> getSms(String phone, String msg);
  
}
