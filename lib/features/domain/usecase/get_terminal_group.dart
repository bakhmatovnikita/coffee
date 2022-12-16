import 'package:cofee/core/error/failure.dart';
import 'package:cofee/core/usecase/usecase.dart';
import 'package:cofee/features/domain/entiti/terminal_group/terminal_group_entiti.dart';
import 'package:cofee/features/domain/repository/coffe_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetTerminalGroup
    extends UseCase<TerminalGroupEntiti, TerminalGroupParams> {
  final CoffeeRepository coffeeRepository;

  GetTerminalGroup(this.coffeeRepository);
  @override
  Future<Either<Failure, TerminalGroupEntiti>> call(
      TerminalGroupParams params) async {
    return await coffeeRepository.getTerminalGroup(
        params.endpoint, params.organizationId);
  }
}

class TerminalGroupParams extends Equatable {
  final String endpoint;
  final String organizationId;

  const TerminalGroupParams({
    required this.endpoint,
    required this.organizationId,
  });
  @override
  List<Object?> get props => [
        endpoint,
        organizationId,
      ];
}
