import 'package:cofee/core/error/failure.dart';
import 'package:cofee/core/usecase/usecase.dart';
import 'package:cofee/features/data/models/cart_to_order.dart/cart_to_order_model.dart';
import 'package:cofee/features/domain/entiti/cart/order_entiti.dart';
import 'package:cofee/features/domain/repository/coffe_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CreateOrder extends UseCase<OrderEntiti, CresteOrderParams> {
  final CoffeeRepository coffeeRepository;

  CreateOrder(this.coffeeRepository);
  @override
  Future<Either<Failure, OrderEntiti>> call(CresteOrderParams params) async {
    return await coffeeRepository.createOrder(
        params.endpoint, params.item, params.phone, params.organizationId, params.paymentTypeKind, params.sum, params.paymentTypeId);
  }
}

class CresteOrderParams extends Equatable {
  final String endpoint;
  final List<Item> item;
  final String phone;
  final String organizationId;
  final String paymentTypeKind;
  final int sum;
  final String paymentTypeId;

  const CresteOrderParams({
    required this.endpoint,
    required this.item,
    required this.phone,
    required this.organizationId,
    required this.paymentTypeKind,
    required this.sum,
    required this.paymentTypeId
  });
  @override
  List<Object?> get props => [endpoint, item, phone, organizationId];
}
