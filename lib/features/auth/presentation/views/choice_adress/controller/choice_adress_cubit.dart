import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/features/auth/presentation/domain/usecase/get_organization.dart';
import 'package:cofee/features/auth/presentation/views/choice_adress/controller/choice_adress_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChoiceAdressCubit extends Cubit<ChoiceAdressState> {
  final GetOrganization getOrganization;

  ChoiceAdressCubit({required this.getOrganization})
      : super(ChoiceAdressEmptyState());
  Future<void> fetchOrganization(String endpoint, String token) async {
    try {
      emit(ChoiceAdressEmptyState());
      final loadedOrganizationOrFailure = await getOrganization.call(
        EndpointParams(
            organizationIds: const ["497f6eca-6276-4993-bfeb-53cbbbba6f08"],
            returnAdditionalInfo: true,
            includeDisabled: true,
            endpoint: endpoint),
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
}
