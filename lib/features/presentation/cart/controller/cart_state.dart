import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartStateEmptyState extends CartState {
  @override
  List<Object?> get props => [];
}

class CartHaveItemState extends CartState {
  final List<CartModel> cartModel;

  CartHaveItemState(this.cartModel);
  @override
  List<Object?> get props => [cartModel];
}

class CartNotHaveItemState extends CartState {
  @override
  List<Object?> get props => [];
}
