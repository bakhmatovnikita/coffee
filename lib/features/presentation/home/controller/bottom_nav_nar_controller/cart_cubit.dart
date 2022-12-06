import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/features/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/features/presentation/home/controller/bottom_nav_nar_controller/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final LocalDatasource localDatasource;
  CartCubit(this.localDatasource) : super(CartEmptyState());
  
  void addToCartItem(CartModel productModel) {
    bool haveEquelsItem = false;
    try {
      List<CartModel> cart = localDatasource.getSavedCart();
       for (var i = 0; i < cart.length; i++) {
        if (productModel.name == cart[i].name) {
          cart[i].count++;
          localDatasource.saveToCart(cart);
          haveEquelsItem = true;
        }
      }
      if (haveEquelsItem == false) {
        cart.add(productModel);
        localDatasource.saveToCart(cart);
        emit(HaveCartState(countCart: cart.length));
      }
    } catch (_) {
      emit(NotHaveCartState());
    }
  }

  void saveToCart(List<CartModel> cartModel) {
    try {
      localDatasource.saveToCart(cartModel);
      emit(HaveCartState(countCart: cartModel.length, cartModel: cartModel));
    } catch (e) {
      emit(CartEmptyState());
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

  void deteteItemInCart(int index) {
    try {
      List<CartModel> cart = localDatasource.getSavedCart();
      cart.removeAt(index);
      localDatasource.saveToCart(cart);
      if (cart.isEmpty) {
        emit(NotHaveCartState());
      } else {
        emit(HaveCartState(countCart: cart.length, cartModel: cart));
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
