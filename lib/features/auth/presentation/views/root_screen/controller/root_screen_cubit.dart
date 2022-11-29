import 'package:cofee/features/auth/presentation/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/auth/presentation/views/root_screen/controller/root_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootScreenCubit extends Cubit<RootScreenState> {
  final LocalDatasource localDatasource;
  RootScreenCubit({required this.localDatasource})
      : super(RootScreenEmptyState());

  Future<void> checkAuthorization() async {
    try {
      final phoneUser = await localDatasource.haveNumber();
      if (phoneUser != false) {
        emit(RootScreenIsAuthorized());
      } else {
        emit(RootScreenEmptyState());
      }
    } catch (e) {
      emit(RootScreenUnauthorized());
    }
  }
}
