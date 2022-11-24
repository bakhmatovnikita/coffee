import 'package:cofee/features/auth/presentation/data/models/organizations_model.dart';
import 'package:cofee/features/auth/presentation/data/models/user_id_model.dart';

abstract class RemoteDatasource {
  Future<UserIdModel> createUser(
      String endpoint, String phoneNumber, String organizationId);
  Future<OrganizationsModel> getOrganizations(List<String> organizationIds,
      bool returnAdditionalInfo, bool includeDisabled, String endpoint);
}
