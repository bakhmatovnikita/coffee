import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/features/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/features/data/models/products/product_model.dart';
import 'package:cofee/features/data/models/products/products_model.dart';
import 'package:cofee/features/presentation/home/controller/bottom_nav_nar_controller/bottom_nav_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  final LocalDatasource localDatasource;
  BottomNavigationBarCubit(this.localDatasource)
      : super(BottomNavigationBarCartEmptyState());
  // final List<CartModel> list = [];
  void addToCartItem(CartModel productModel) {
    try {
      // final int itemCountCart = localDatasource.getLengthCart()!;
      BackConstants.cart.add(productModel);
      print(BackConstants.cart.length);
      localDatasource.saveToCart(BackConstants.cart);
      emit(BottomNavigationBarHaveCartState(
          countCart: BackConstants.cart.length));
    } catch (_) {
      emit(BottomNavigationBarNotHaveCartState());
    }
  }

  void deleteCart() {
    try {
      localDatasource.delecteCart();
      emit(BottomNavigationBarNotHaveCartState());
    } catch (_) {
      emit(BottomNavigationBarCartEmptyState());
    }
  }
}
