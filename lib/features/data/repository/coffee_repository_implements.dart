import 'package:cofee/core/error/failure.dart';
import 'package:cofee/features/data/datasorces/local_datasource/local_datasource.dart';
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
import 'package:cofee/features/domain/entiti/organizations_entiti.dart';
import 'package:cofee/features/domain/entiti/products/products_entiti.dart';
import 'package:cofee/features/domain/entiti/status_terminal_entiti/status_terminal_entiti.dart';
import 'package:cofee/features/domain/entiti/terminal_group/terminal_group_entiti.dart';
import 'package:cofee/features/domain/entiti/token_entiti.dart';
import 'package:cofee/features/domain/entiti/user_id_entiti.dart';
import 'package:cofee/features/domain/entiti/user_info/user_info_entiti.dart';
import 'package:cofee/features/domain/repository/coffe_repository.dart';
import 'package:dartz/dartz.dart';

class CoffeeRepositoryImpl implements CoffeeRepository {
  final RemoteDatasource remoteDatasource;
  final LocalDatasource localDatasource;

  CoffeeRepositoryImpl(this.remoteDatasource, this.localDatasource);
  @override
  Future<Either<Failure, UserIdEntiti>> createUser(
      String endpoint, String phone, String organizationId,
      [String? email, String? name]) async {
    return await _createUser(
        () => remoteDatasource.createUser(
            endpoint, phone, organizationId, email, name),
        phone,
        organizationId);
  }

  Future<Either<Failure, UserIdModel>> _createUser(
      Future<UserIdModel> Function() user,
      String phone,
      String organizationId) async {
    try {
      final userModel = await user();
      localDatasource.saveUserId(userModel);
      localDatasource.savePhoneUser(phone);
      localDatasource.saveOrganizationId(organizationId);
      return Right(userModel);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrganizationsEntiti>> getOrganization(
    List<String> organizationIds,
    bool returnAdditionalInfo,
    bool includeDisabled,
    String endpoint,
  ) async {
    return await _getOrganization(() => remoteDatasource.getOrganizations(
        organizationIds, returnAdditionalInfo, includeDisabled, endpoint));
  }

  Future<Either<Failure, OrganizationsModel>> _getOrganization(
      Future<OrganizationsModel> Function() organization) async {
    try {
      final organizationModel = await organization();
      localDatasource.saveOrganizationId(organizationModel.organizations[0].id);
      return Right(organizationModel);
    } catch (e) {
      print(e);
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, TokenEntiti>> getToken(String endpoint) async {
    return await _getToken(() => remoteDatasource.getToken(endpoint));
  }

  Future<Either<Failure, TokenModel>> _getToken(
      Future<TokenModel> Function() token) async {
    try {
      final tokenModel = await token();
      localDatasource.saveToken(tokenModel.token);
      print('SAVE TOKEN: ${tokenModel.token}');
      return Right(tokenModel);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductsEntiti>> getProducts(String endpoint) async {
    return await _getProducts(() => remoteDatasource.getProducts(endpoint));
  }

  Future<Either<Failure, ProductsModel>> _getProducts(
      Future<ProductsModel> Function() products) async {
    try {
      final productsModel = await products();
      return Right(productsModel);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, TerminalGroupEntiti>> getTerminalGroup(
      String endpoint, String organizationId) async {
    return await _getTerminalGroup(
        () => remoteDatasource.fetchTerminalGroup(endpoint, organizationId));
  }

  Future<Either<Failure, TerminalGroupModel>> _getTerminalGroup(
      Future<TerminalGroupModel> Function() terminalGroup) async {
    try {
      final terminalGroupModel = await terminalGroup();
      localDatasource.saveTerminalGroup(terminalGroupModel);
      return Right(terminalGroupModel);
    } catch (e) {
      print(e);
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderModel>> createOrder(
      String endpoint,
      List<Item> item,
      String phone,
      String organizationId,
      String paymentTypeKind,
      int sum,
      String paymentTypeId) async {
    return await _createOrder(() => remoteDatasource.createOrder(endpoint, item,
        phone, organizationId, paymentTypeKind, sum, paymentTypeId));
  }

  Future<Either<Failure, OrderModel>> _createOrder(
      Future<OrderModel> Function() order) async {
    try {
      final orderModel = await order();
      final ordersId = await localDatasource.getOrdersId();
      ordersId.add(orderModel.orderInfo.id);
      await localDatasource.saveHistory(ordersId);
      return Right(orderModel);
    } catch (e) {
      print(e);
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, HistoryOrderModel>> getOrderHistory(String endpoint,
      List<String> organizationIds, List<String> ordersId) async {
    return await _getOrderHistory(
        () => remoteDatasource.getHistory(endpoint, organizationIds, ordersId));
  }

  Future<Either<Failure, HistoryOrderModel>> _getOrderHistory(
      Future<HistoryOrderModel> Function() history) async {
    try {
      final historyModel = await history();
      return Right(historyModel);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, SelectCartModel>> getCart(
      String endpoint, String organizationId) async {
    return await _getCart(
      () => remoteDatasource.getCarts(endpoint, organizationId),
    );
  }

  Future<Either<Failure, SelectCartModel>> _getCart(
      Future<SelectCartModel> Function() cart) async {
    try {
      final cartModel = await cart();
      return Right(cartModel);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderTypesModel>> getOrderTypes(
      String endpoint, String organizationId) async {
    return await _getOrderTypes(
        () => remoteDatasource.getOrderTypes(endpoint, organizationId));
  }

  Future<Either<Failure, OrderTypesModel>> _getOrderTypes(
      Future<OrderTypesModel> Function() orderTypes) async {
    try {
      final orderType = await orderTypes();
      return Right(orderType);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserInfoEntiti>> getUserInfo() async {
    try {
      final result = await remoteDatasource.getUserInfo(
        await localDatasource.getPhoneUser(),
        await localDatasource.getOrganizatuonId(),
      );
      return Right(result);
    } catch (e) {
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, StatusTerminalEntiti>> getStatusTerminal(String organizationId, String terminalGroupId) async {
    try {
      final data = await remoteDatasource.getStatusTerminal(organizationId, terminalGroupId);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
