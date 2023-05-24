import 'package:cofee/features/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/domain/usecase/create_user.dart';
import 'package:cofee/features/presentation/profile/edit_profile/controller/edit_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final CreateUser createUser;
  final LocalDatasource localDatasource;

  EditProfileCubit({
    required this.createUser,
    required this.localDatasource,
  }) : super(EditProfileEmptyState());
  Future<void> createCustomer(String endpoint, String phone,
      [String? email, String? name]) async {
    try {
      await createUser.call(
        EndpointUserParams(
          endpoint: endpoint,
          phone: phone,
          organizationId: await localDatasource.getOrganizatuonId(),
          email: email,
          name: name,
        ),
      );
      //TODO Убрать этот кубит и использовать ProfilePageCubit
    } catch (_) {
      rethrow;
    }
  }
}
