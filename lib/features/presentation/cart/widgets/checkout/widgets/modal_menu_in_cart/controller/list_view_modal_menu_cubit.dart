import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/modal_menu_in_cart/controller/list_view_modal_menu_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewCubit extends Cubit<ListViewState> {
  ListViewCubit() : super(EmptyListViewState());
  Future<void> addToModalCart(CartModel cartModal) async {
    try {
      emit(EmptyListViewState());
      bool isHaveEquelsProduct = false;
      List<CartModel> list = BackConstants.modalCart;
      for (var i = 0; i < list.length; i++) {
        if (list[i].name == cartModal.name) {
          list[i].count++;
          isHaveEquelsProduct = true;
          emit(HaveListViewState(cart: list));
        }
      }
      if (isHaveEquelsProduct == false) {
        BackConstants.modalCart.add(cartModal);
        if (BackConstants.modalCart.isEmpty) {
          emit(HaveListViewState(cart: BackConstants.modalCart));
        } else {
          emit(HaveListViewState(cart: list));
        }
      }
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

  Future<void> deleteOneInModalCart(int index) async {
    try {
      emit(EmptyListViewState());
      BackConstants.modalCart.removeAt(index);
      if (BackConstants.modalCart.isEmpty) {
        emit(NotHaveListViewState());
      } else {
        emit(HaveListViewState(cart: BackConstants.modalCart));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> saveToCart(List<CartModel> cart) async {
    try {
      emit(EmptyListViewState());

      if (cart.isEmpty) {
        emit(NotHaveListViewState());
      } else {
        emit(HaveListViewState(cart: cart));
      }
    } catch (e) {
      emit(EmptyListViewState());
    }
  }

  Future<void> getItemsCart(List<CartModel> cart) async {
    try {
      emit(EmptyListViewState());

      await Future.delayed(const Duration(milliseconds: 200));
      if (cart.isEmpty) {
        emit(NotHaveListViewState());
      } else {
        emit(HaveListViewState(
          cart: cart,
        ));
      }
    } catch (e) {
      emit(NotHaveListViewState());
    }
  }
}
