import 'package:cofee/core/error/failure.dart';
import 'package:cofee/core/usecase/usecase.dart';
import 'package:cofee/features/domain/entiti/status_terminal_entiti/status_terminal_entiti.dart';
import 'package:cofee/features/domain/repository/coffe_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetStatusTerminal
    extends UseCase<StatusTerminalEntiti, GetStatusTerminalParams> {
  final CoffeeRepository coffeeRepository;

  GetStatusTerminal({required this.coffeeRepository});

  @override
  Future<Either<Failure, StatusTerminalEntiti>> call(params) async {
    return await coffeeRepository.getStatusTerminal(
        params.organizationId, params.terminalGroupId);
  }
}

class GetStatusTerminalParams extends Equatable {
  final String organizationId;
  final String terminalGroupId;

  const GetStatusTerminalParams(
      {required this.organizationId, required this.terminalGroupId});
  @override
  List<Object?> get props => [
        organizationId,
        terminalGroupId,
      ];
}
