import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/features/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/features/presentation/home/controller/bottom_nav_nar_controller/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final LocalDatasource localDatasource;
  CartCubit(this.localDatasource) : super(CartEmptyState());
  void addToCartItem(CartModel productModel) {
    try {
      BackConstants.cart.add(productModel);
      localDatasource.saveToCart(BackConstants.cart);
      final int itemCountCart = localDatasource.getLengthCart();
      print(BackConstants.cart.length);
      emit(HaveCartState(countCart: itemCountCart));
    } catch (_) {
      emit(NotHaveCartState());
    }
  }

  void deleteCart() {
    try {
      localDatasource.delecteCart();
      emit(NotHaveCartState());
    } catch (_) {
      emit(CartEmptyState());
    }
  }

  void deteteItemInCart(int index){
    try {
      BackConstants.cart.removeAt(index);
      localDatasource.saveToCart(BackConstants.cart);
      final int itemCountCart = localDatasource.getLengthCart();
      final list = localDatasource.getSavedCart();
      print(BackConstants.cart.length);
      if (list.isEmpty) {
        emit(NotHaveCartState());
      }else{
      emit(HaveCartState(countCart: itemCountCart, cartModel: list));

      }
    } catch (_) {
      emit(NotHaveCartState());
    }
  }

  void getItemsCart() async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));
      emit(HaveCartState(
          countCart: localDatasource.getSavedCart().length,
          cartModel: localDatasource.getSavedCart()));
    } catch (e) {
      emit(NotHaveCartState());
    }
  }
}
