import 'package:equatable/equatable.dart';

abstract class BottomNavigationBarState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BottomNavigationBarHaveCartState extends BottomNavigationBarState {
  final int countCart;

  BottomNavigationBarHaveCartState(this.countCart);
  @override
  List<Object?> get props => [countCart];
}

class BottomNavigationBarNotHaveCartState extends BottomNavigationBarState {
  @override
  List<Object?> get props => [];
}
