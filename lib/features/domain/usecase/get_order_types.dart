import 'package:cofee/core/error/failure.dart';
import 'package:cofee/core/usecase/usecase.dart';
import 'package:cofee/features/domain/entiti/order_types/order_types_entiti.dart';
import 'package:cofee/features/domain/repository/coffe_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';



class GetOrderTypes extends UseCase<OrderTypesEntiti, GetOrderTypesParams>{
  final CoffeeRepository coffeeRepository;

  GetOrderTypes(this.coffeeRepository);

  @override
  Future<Either<Failure, OrderTypesEntiti>> call(GetOrderTypesParams params) async {
    return await coffeeRepository.getOrderTypes(params.endpoint, params.organizationId);
  }
}
class GetOrderTypesParams extends Equatable {
  final String endpoint;
  final String organizationId;

  const GetOrderTypesParams({
    required this.endpoint,
    required this.organizationId,
  });
  @override
  List<Object?> get props => [endpoint, organizationId];
}
