import 'package:cofee/features/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/presentation/cart/controller/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final LocalDatasource localDatasource;
  CartCubit(this.localDatasource) : super(CartStateEmptyState());

  Future<void> getItemsCart() async {
    try {
      emit(CartStateEmptyState());
      final list = localDatasource.getSavedCart();
      emit(CartHaveItemState(list));
    } catch (e) {
      emit(CartNotHaveItemState());
    }
  }

  int getLengthCart() {
    try {
      int count = localDatasource.getLengthCart();
      return count;
    } catch (e) {
      return 0;
    }
  }
}
