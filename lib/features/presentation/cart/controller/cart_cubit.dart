import 'package:cofee/features/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/presentation/cart/controller/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewCubit extends Cubit<CartViewState> {
  final LocalDatasource localDatasource;
  CartViewCubit({required this.localDatasource}) : super(CartViewEmptyState());
  Future<void> checkAuthorization() async {
    try {
      final phoneUser = await localDatasource.haveNumber();
      if (phoneUser != false) {
        emit(CartViewHaveNumberState());
      } else if (phoneUser == false) {
        emit(CartViewNotHaveNumberState());
      } else {
        emit(CartViewEmptyState());
      }
    } catch (e) {
      emit(CartViewNotHaveNumberState());
    }
  }
}
