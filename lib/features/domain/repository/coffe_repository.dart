import 'package:cofee/core/error/failure.dart';
import 'package:cofee/features/data/models/cart/order_model.dart';
import 'package:cofee/features/data/models/cart_to_order.dart/cart_to_order_model.dart';
import 'package:cofee/features/data/models/history/histroy_model.dart';
import 'package:cofee/features/data/models/order_types/order_types.dart';
import 'package:cofee/features/data/models/select_cart/select_cart_model.dart';
import 'package:cofee/features/data/models/user_info/user_info_model.dart';
import 'package:cofee/features/domain/entiti/products/products_entiti.dart';
import 'package:cofee/features/domain/entiti/terminal_group/terminal_group_entiti.dart';
import 'package:cofee/features/domain/entiti/token_entiti.dart';
import 'package:cofee/features/domain/entiti/user_id_entiti.dart';
import 'package:dartz/dartz.dart';

import '../entiti/organizations_entiti.dart';

abstract class CoffeeRepository {
  Future<Either<Failure, UserIdEntiti>> createUser(
      String endpoint, String phone, String organizationId);
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
  Future<Either<Failure, HistoryModel>> getOrderHistory(
      String endpoint, String phone, List<String> organizationIds);
  Future<Either<Failure, SelectCartModel>> getCart(
      String endpoint, String organizationId);
  Future<Either<Failure, OrderTypesModel>> getOrderTypes(
      String endpoint, String organizationId);
  Future<Either<Failure, UserInfoModel>> getUserInfo(
      String endpoint, String phone, String organizationId);
}
