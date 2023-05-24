import 'package:cofee/core/services/auth_config/time_accept.dart';
import 'package:cofee/custom_widgets/not_have_day.dart';
import 'package:cofee/features/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/features/data/models/cart_to_order.dart/cart_to_order_model.dart';
import 'package:cofee/features/domain/usecase/create_order.dart';
import 'package:cofee/features/domain/usecase/get_status_terminal.dart';
import 'package:cofee/features/presentation/home/controller/bottom_nav_nar_controller/cart_state.dart';
import 'package:cofee/injection.container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class CartCubit extends Cubit<CartState> {
  final LocalDatasource localDatasource;
  final CreateOrder createOrder;
  final GetStatusTerminal getStatusTerminal;
  CartCubit(this.localDatasource, this.createOrder, this.getStatusTerminal)
      : super(CartEmptyState());

  Future<void> getStatus(
      int day, String month, String weekDay, Function() onTap) async {
    try {
      final result = await getStatusTerminal.call(
        GetStatusTerminalParams(
          organizationId: await localDatasource.getOrganizatuonId(),
          terminalGroupId: await localDatasource.getTerminalGroup(),
        ),
      );
      result.fold(
        (error) {
          SmartDialog.show(
            animationType: SmartAnimationType.fade,
            builder: (context) => const SafeArea(
              child: Align(
                alignment: Alignment.center,
                child: NotHaveDay(),
              ),
            ),
          );
        },
        (data) {
          if (!data.isAliveStatus[0].isAlive) {
            SmartDialog.show(
              animationType: SmartAnimationType.fade,
              builder: (context) => const SafeArea(
                child: Align(
                  alignment: Alignment.center,
                  child: NotHaveDay(),
                ),
              ),
            );
          } else {
            sl<AcceptTime>().day = day;
            sl<AcceptTime>().month = month;
            sl<AcceptTime>().weekDay = weekDay;
            onTap();
          }
        },
      );
    } catch (e) {
      rethrow;
    }
  }

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

  Future<void> createClientOrder(
      String endpoint,
      List<Item> item,
      String paymentTypeKind,
      int sum,
      String paymentTypeId,
      Function() onError,
      Function() onSucces) async {
    try {
      final value = await createOrder.call(
        CresteOrderParams(
          endpoint: endpoint,
          item: item,
          phone: await localDatasource.getPhoneUser(),
          organizationId: await localDatasource.getOrganizatuonId(),
          paymentTypeKind: paymentTypeKind,
          sum: sum,
          paymentTypeId: paymentTypeId,
        ),
      );
      value.fold(
        (error) {
          final cart = localDatasource.getSavedCart();
          onError();
          emit(HaveCartState(countCart: cart.length, cartModel: cart));
        },
        (good) {
          localDatasource.delecteCart();
          onSucces();
          emit(NotHaveCartState());
        },
      );
    } catch (e) {
      final cart = localDatasource.getSavedCart();
      emit(HaveCartState(countCart: cart.length, cartModel: cart));
    }
  }
}
