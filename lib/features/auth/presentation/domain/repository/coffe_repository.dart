import 'package:cofee/core/error/failure.dart';
import 'package:cofee/features/auth/presentation/domain/entiti/user_id_entiti.dart';
import 'package:dartz/dartz.dart';

import '../entiti/organizations_entiti.dart';

abstract class CoffeeRepository {
  Future<Either<Failure, UserIdEntiti>> createUser(
      String endpoint, String phone, String organizationId);
  Future<Either<Failure, OrganizationsEntiti>> getOrganization(
      List<String> organizationIds,
      bool returnAdditionalInfo,
      bool includeDisabled,
      String endpoint);
}
