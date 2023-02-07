import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/features/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/domain/usecase/get_cart.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/selected_cart/controller/select_cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectCartCubit extends Cubit<SelectCartState> {
  final GetCart getCart;
  final LocalDatasource localDatasource;

  SelectCartCubit({required this.getCart, required this.localDatasource})
      : super(SelectCartEmptyState());

  Future<void> fetchCart(String endpoint) async {
    try {
      final loadedCartOrFailure = await getCart.call(
        EndpointUserParams(
          endpoint: endpoint,
          organizationId: await localDatasource.getOrganizatuonId(),
        ),
      );
      loadedCartOrFailure.fold(
        (error) => emit(SelectCartErrorState(
            message: BackConstants.SERVER_FAILURE_MESSAGE)),
        (data) => emit(
          SelectCartLoadedState(selectCartEntiti: data),
        ),
      );
    } catch (e) {
      emit(SelectCartErrorState(message: BackConstants.SERVER_FAILURE_MESSAGE));
    }
  }
}
