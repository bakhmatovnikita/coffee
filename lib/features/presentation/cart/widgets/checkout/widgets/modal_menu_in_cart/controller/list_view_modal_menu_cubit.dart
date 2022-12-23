import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/modal_menu_in_cart/controller/list_view_modal_menu_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewCubit extends Cubit<ListViewState> {
  ListViewCubit() : super(EmptyListViewState());
  Future<void> addToModalCart(CartModel cartModal) async {
    try {
      emit(EmptyListViewState());
      BackConstants.modalCart.add(cartModal);
      emit(HaveListViewState(cart: BackConstants.modalCart));
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteAllInModalCart() async {
    try {
      emit(EmptyListViewState());
      BackConstants.modalCart.clear();
      emit(NotHaveListViewState());
    } catch (e) {
      print(e);
    }
  }
}
