import 'package:cofee/core/error/failure.dart';
import 'package:cofee/core/usecase/usecase.dart';
import 'package:cofee/features/auth/presentation/domain/entiti/token_entiti.dart';
import 'package:cofee/features/auth/presentation/domain/repository/coffe_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetToken extends UseCase<TokenEntiti, EndpointTokenParams> {
  final CoffeeRepository coffeeRepository;

  GetToken(this.coffeeRepository);
  @override
  Future<Either<Failure, TokenEntiti>> call(EndpointTokenParams params) async {
    return await coffeeRepository.getToken(params.endpoint);
  }
}

class EndpointTokenParams extends Equatable {
  final String endpoint;

  const EndpointTokenParams({
    required this.endpoint,
  });
  @override
  List<Object?> get props => [endpoint];
}
