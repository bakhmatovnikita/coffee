import 'package:cofee/features/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/features/data/models/cart_to_order.dart/cart_to_order_model.dart';
import 'package:cofee/features/domain/usecase/create_order.dart';
import 'package:cofee/features/presentation/home/controller/bottom_nav_nar_controller/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final LocalDatasource localDatasource;
  final CreateOrder createOrder;
  CartCubit(this.localDatasource, this.createOrder) : super(CartEmptyState());
  void addToCartItem(CartModel productModel) {
    try {
      List<CartModel> cart = localDatasource.getSavedCart();
      bool haveEquelsItem = false;
      for (var i = 0; i < cart.length; i++) {
        if (productModel.name == cart[i].name) {
          cart[i].count++;
          localDatasource.saveToCart(cart);
          haveEquelsItem = true;
          emit(HaveCartState(countCart: cart.length, cartModel: cart));
        }
      }
      if (haveEquelsItem == false) {
        cart.add(productModel);
        localDatasource.saveToCart(cart);
        emit(HaveCartState(countCart: cart.length, cartModel: cart));
      }
    } catch (_) {
      emit(NotHaveCartState());
    }
  }

  void saveToCart(List<CartModel> cartModel) {
    try {
      if (cartModel.isEmpty) {
        emit(NotHaveCartState());
      } else {
        localDatasource.saveToCart(cartModel);
        emit(HaveCartState(countCart: cartModel.length, cartModel: cartModel));
      }
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
      final cart = localDatasource.getSavedCart();
      if (cart.isEmpty) {
        emit(NotHaveCartState());
      } else {
        emit(HaveCartState(
          countCart: cart.length,
          cartModel: cart,
        ));
      }
    } catch (e) {
      emit(NotHaveCartState());
    }
  }

  Future<void> createClientOrder(String endpoint, List<Item> item) async {
    try {
      print(await localDatasource.getPhoneUser());
      createOrder.call(
        CresteOrderParams(
          endpoint: endpoint,
          item: item,
          phone: await localDatasource.getPhoneUser(),
          organizationId: await localDatasource.getOrganizatuonId(),
        ),
      );
      localDatasource.delecteCart();
      emit(NotHaveCartState());
    } catch (e) {
      final cart = localDatasource.getSavedCart();
      emit(HaveCartState(countCart: cart.length, cartModel: cart));
    }
  }
}
