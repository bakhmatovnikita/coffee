import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/features/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/domain/entiti/organizations_entiti.dart';
import 'package:cofee/features/domain/entiti/user_info/user_info_entiti.dart';
import 'package:cofee/features/domain/usecase/get_organization.dart';
import 'package:cofee/features/domain/usecase/get_user_info.dart';
import 'package:cofee/features/presentation/profile/%20personal_area/controller/profile_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePageCubit extends Cubit<ProfilePageState> {
  final GetOrganization getOrganization;
  final LocalDatasource localDatasource;
  final GetUserInfo getUserInfo;
  ProfilePageCubit({
    required this.getOrganization,
    required this.localDatasource,
    required this.getUserInfo,
  }) : super(ProfilePageEmptyState());
  Future<void> fetchUserInfo(
    String endpoint,
  ) async {
    try {
      late UserInfoEntiti userInfoEntiti;
      late OrganizationsEntiti organizationsEntiti;
      emit(ProfileLoadingState());
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
      final loadedUserInfoOrFailure = await getUserInfo.call(UserInfoParams());
      loadedOrganizationOrFailure.fold(
          (error) => {
                emit(
                  ProfilePageErrorState(
                      message: BackConstants.SERVER_FAILURE_MESSAGE),
                ),
              },
          (data) => {
                organizationsEntiti = data,
              });
      loadedUserInfoOrFailure.fold(
          (error) => {
                emit(
                  ProfilePageErrorState(
                      message: BackConstants.SERVER_FAILURE_MESSAGE),
                ),
              },
          (data) => {
                userInfoEntiti = data,
              });
      emit(ProfilePageLoadedState(organizationsEntiti: organizationsEntiti, userInfoEntiti: userInfoEntiti));
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
