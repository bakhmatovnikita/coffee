import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartEmptyState extends CartState {
  @override
  List<Object?> get props => [];
}

class HaveCartState extends CartState {
  final int countCart;
  final List<CartModel>? cartModel;

  HaveCartState({
    required this.countCart,
    this.cartModel,
  });
  @override
  List<Object?> get props => [countCart, cartModel];
}

class NotHaveCartState extends CartState {
  @override
  List<Object?> get props => [];
}
