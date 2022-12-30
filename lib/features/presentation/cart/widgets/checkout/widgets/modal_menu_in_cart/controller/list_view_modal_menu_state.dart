import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:equatable/equatable.dart';

class ListViewState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmptyListViewState extends ListViewState {
  @override
  List<Object?> get props => [];
}

class HaveListViewState extends ListViewState {
  final List<CartModel> cart;

  HaveListViewState({required this.cart});
  @override
  List<Object?> get props => [cart];
}

class NotHaveListViewState extends ListViewState {
  @override
  List<Object?> get props => [];
}
