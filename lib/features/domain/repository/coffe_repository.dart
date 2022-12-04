import 'package:cofee/core/error/failure.dart';
import 'package:cofee/features/domain/entiti/products/products_entiti.dart';
import 'package:cofee/features/domain/entiti/token_entiti.dart';
import 'package:cofee/features/domain/entiti/user_id_entiti.dart';
import 'package:dartz/dartz.dart';

import '../entiti/organizations_entiti.dart';

abstract class CoffeeRepository {
  Future<Either<Failure, UserIdEntiti>> createUser(String endpoint, String phone, String organizationId);
  Future<Either<Failure, OrganizationsEntiti>> getOrganization(List<String> organizationIds, bool returnAdditionalInfo, bool includeDisabled, String endpoint);
  Future<Either<Failure, TokenEntiti>> getToken(String endpoint);
  Future<Either<Failure, ProductsEntiti>> getProducts(String endpoint);
}