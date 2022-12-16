import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/features/domain/usecase/create_user.dart';
import 'package:cofee/features/domain/usecase/get_organization.dart';
import 'package:cofee/features/domain/usecase/get_terminal_group.dart';
import 'package:cofee/features/domain/usecase/get_token.dart';
import 'package:cofee/features/presentation/auth/choice_adress/controller/choice_adress_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChoiceAdressCubit extends Cubit<ChoiceAdressState> {
  final GetOrganization getOrganization;
  final CreateUser createUser;
  final GetToken getToken;
  final GetTerminalGroup getTerminalGroup;

  ChoiceAdressCubit({
    required this.getToken,
    required this.getOrganization,
    required this.createUser,
    required this.getTerminalGroup,
  }) : super(ChoiceAdressEmptyState());
  Future<void> fetchTerminalGroup(
      String endpoint, String organizationId) async {
    try {
      getTerminalGroup.call(
        TerminalGroupParams(endpoint: endpoint, organizationId: organizationId),
      );
    } catch (_) {
      // emit(
      //   ChoiceAdressErrorState(message: BackConstants.SERVER_FAILURE_MESSAGE),
      // );
    }
  }

  Future<void> fetchOrganization(
    String endpoint,
  ) async {
    try {
      emit(ChoiceAdressEmptyState());
      final loadedOrganizationOrFailure = await getOrganization.call(
        EndpointParams(
          organizationIds: const ["497f6eca-6276-4993-bfeb-53cbbbba6f08"],
          returnAdditionalInfo: true,
          includeDisabled: true,
          endpoint: endpoint,
        ),
      );
      loadedOrganizationOrFailure.fold(
        (error) => null,
        (loadedData) => emit(
          ChoiceAdressLoadedState(loadedData),
        ),
      );
    } catch (_) {
      emit(
        ChoiceAdressErrorState(message: BackConstants.SERVER_FAILURE_MESSAGE),
      );
    }
  }

  bool createCustomer(String endpoint, String organizationId, String phone) {
    try {
      createUser.call(
        EndpointUserParams(
          endpoint: endpoint,
          phone: phone,
          organizationId: organizationId,
        ),
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  // Future<void> createUser(
  //     String endpoint, String organizationId, String phone) async {
  //   try {
  //     emit(ChoiceAdressEmptyState());
  //     final createdUSerOrFailure = await createUser.call(
  //       EndpointUserParams(
  //         endpoint: "loyalty/iiko/customer/create_or_update",
  //         phone: phone,
  //         organizationId: organizationId,
  //       ),
  //     );
  //     createdUSerOrFailure.fold(
  //       (error) => null,
  //       (createdUser) => emit(
  //         ChoiceAdressLoadedState(),
  //       ),
  //     );
  //   } catch (_) {
  //     emit(
  //       ChoiceAdressErrorState(message: BackConstants.SERVER_FAILURE_MESSAGE),
  //     );
  //   }
  // }
}
