import 'package:cofee/core/error/failure.dart';
import 'package:cofee/core/usecase/usecase.dart';
import 'package:cofee/features/domain/entiti/select_cart/select_cart_entiti.dart';
import 'package:cofee/features/domain/repository/coffe_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetCart extends UseCase<SelectCartEntiti, EndpointUserParams> {
  final CoffeeRepository coffeeRepository;

  GetCart({required this.coffeeRepository});

  @override
  Future<Either<Failure, SelectCartEntiti>> call(
      EndpointUserParams params) async {
    return coffeeRepository.getCart(params.endpoint, params.organizationId);
  }
}

class EndpointUserParams extends Equatable {
  final String endpoint;
  final String organizationId;

  const EndpointUserParams({
    required this.endpoint,
    required this.organizationId,
  });
  @override
  List<Object?> get props => [endpoint, organizationId];
}
