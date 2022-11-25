import 'package:cofee/core/error/failure.dart';
import 'package:cofee/core/usecase/usecase.dart';
import 'package:cofee/features/auth/presentation/domain/entiti/user_id_entiti.dart';
import 'package:cofee/features/auth/presentation/domain/repository/coffe_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CreateUser implements UseCase<UserIdEntiti, EndpointUserParams> {
  final CoffeeRepository coffeeRepository;

  CreateUser(this.coffeeRepository);
  @override
  Future<Either<Failure, UserIdEntiti>> call(EndpointUserParams params) async {
    return await coffeeRepository.createUser(
        params.endpoint, params.phone, params.organizationId);
  }
}

class EndpointUserParams extends Equatable {
  final String endpoint;
  final String phone;
  final String organizationId;

  const EndpointUserParams({
    required this.endpoint,
    required this.phone,
    required this.organizationId,
  });
  @override
  List<Object?> get props => [endpoint, phone, organizationId];
}
