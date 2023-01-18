import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/features/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/domain/usecase/get_organization.dart';
import 'package:cofee/features/presentation/profile/%20personal_area/controller/profile_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePageCubit extends Cubit<ProfilePageState> {
  final GetOrganization getOrganization;
  final LocalDatasource localDatasource;
  ProfilePageCubit(
      {required this.getOrganization, required this.localDatasource})
      : super(ProfilePageEmptyState());
  Future<void> fetchOrganization(
    String endpoint,
  ) async {
    try {
      emit(ProfilePageEmptyState());
      final loadedOrganizationOrFailure = await getOrganization.call(
        EndpointParams(
          organizationIds: [
            await localDatasource.getOrganizatuonId(),
          ],
          returnAdditionalInfo: true,
          includeDisabled: true,
          endpoint: endpoint,
        ),
      );
      loadedOrganizationOrFailure.fold(
        (error) {
          print(error);
          emit(
            ProfilePageErrorState(message: error.toString()),
          );
        },
        (loadedData) => emit(
          ProfilePageLoadedState(loadedData),
        ),
      );
    } catch (_) {
      emit(
        ProfilePageErrorState(message: BackConstants.SERVER_FAILURE_MESSAGE),
      );
    }
  }

  bool saveOrganization(String organizationId) {
    try {
      localDatasource.saveOrganizationId(organizationId);
      return true;
    } catch (_) {
      return false;
    }
  }
}
