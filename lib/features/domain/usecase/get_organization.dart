import 'package:cofee/core/error/failure.dart';
import 'package:cofee/core/usecase/usecase.dart';
import 'package:cofee/features/domain/entiti/organizations_entiti.dart';
import 'package:cofee/features/domain/repository/coffe_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetOrganization extends UseCase<OrganizationsEntiti, EndpointParams> {
  final CoffeeRepository coffeeRepository;

  GetOrganization(this.coffeeRepository);
  @override
  Future<Either<Failure, OrganizationsEntiti>> call(
      EndpointParams params) async {
    return await coffeeRepository.getOrganization(
      params.organizationIds,
      params.returnAdditionalInfo,
      params.includeDisabled,
      params.endpoint,
    );
  }
}

class EndpointParams extends Equatable {
  final List<String> organizationIds;
  final bool returnAdditionalInfo;
  final bool includeDisabled;
  final String endpoint;

  const EndpointParams({
    required this.organizationIds,
    required this.returnAdditionalInfo,
    required this.includeDisabled,
    required this.endpoint,
  });
  @override
  List<Object?> get props =>
      [organizationIds, returnAdditionalInfo, includeDisabled];
}
