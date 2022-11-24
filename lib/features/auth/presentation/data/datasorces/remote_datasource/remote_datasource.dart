import 'package:cofee/features/auth/presentation/data/models/user_id_model.dart';
import 'package:cofee/features/auth/presentation/domain/entiti/user_id_entiti.dart';

abstract class RemoteDatasource {
  Future<UserIdModel> createUser(String endpoint, String phoneNumber, String organizationId);
}
