import 'package:cofee/core/error/failure.dart';
import 'package:cofee/core/usecase/usecase.dart';
import 'package:cofee/features/auth/presentation/domain/entiti/user_id_entiti.dart';
import 'package:cofee/features/auth/presentation/domain/repository/coffe_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CreateUser implements UseCase<UserIdEntiti, EndpointParams> {
  final CoffeeRepository coffeeRepository;

  CreateUser(this.coffeeRepository);
  @override
  Future<Either<Failure, UserIdEntiti>> call(EndpointParams params) async {
    return await coffeeRepository.createUser(
        params.endpoint, params.phone, params.organizationId);
  }
}

class EndpointParams extends Equatable {
  final String endpoint;
  final String phone;
  final String organizationId;

  const EndpointParams({
    required this.endpoint,
    required this.phone,
    required this.organizationId,
  });
  @override
  List<Object?> get props => [endpoint, phone, organizationId];
}
