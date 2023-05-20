import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/features/domain/usecase/get_history.dart';
import 'package:cofee/features/presentation/profile/history/controller/history_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/datasorces/local_datasource/local_datasource.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final LocalDatasource localDatasource;
  final GetHistory getHistory;

  HistoryCubit({
    required this.getHistory,
    required this.localDatasource,
  }) : super(HistoryEmptyState());

  Future<void> getUserHistory(
    String endpoint,
  ) async {
    try {
      emit(HistoryEmptyState());
      final loadedHistoryOrFailure = await getHistory.call(
        HistoryEndpointParams(
          endpoint: endpoint,
          organizationIds: [await localDatasource.getOrganizatuonId()],
          ordersId: await localDatasource.getOrdersId(),
        ),
      );
      loadedHistoryOrFailure.fold(
          (error) => emit(HistoryErrorState(message: error.toString())),
          (loadedHistory) => emit(HistoryLoadedSatate(loadedHistory)));
    } catch (_) {
      emit(
        HistoryErrorState(message: BackConstants.SERVER_FAILURE_MESSAGE),
      );
    }
  }
}
