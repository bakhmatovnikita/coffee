import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/features/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/domain/usecase/get_order_types.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/way_of_obtaining/controller/way_of_obtaining_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTypesCubit extends Cubit<OrderTypesState> {
  final GetOrderTypes getOrderTypes;
  final LocalDatasource localDatasource;
  OrderTypesCubit({
    required this.getOrderTypes,
    required this.localDatasource,
  }) : super(OrderTypesEmptyState());

  Future<void> fetchOrderTypes(String endpoint) async {
    try {
      final loadedOrFailureOrderTypes = await getOrderTypes.call(
          GetOrderTypesParams(
              endpoint: endpoint,
              organizationId: await localDatasource.getOrganizatuonId()));
      loadedOrFailureOrderTypes.fold(
        (error) => emit(OrderTypesErrorState(
            message: BackConstants.SERVER_FAILURE_MESSAGE)),
        (orderTypes) => emit(
          OrderTypesLoadedState(orderTypesEntiti: orderTypes),
        ),
      );
    } catch (e) {
      emit(
        OrderTypesErrorState(message: BackConstants.SERVER_FAILURE_MESSAGE),
      );
    }
  }
}
