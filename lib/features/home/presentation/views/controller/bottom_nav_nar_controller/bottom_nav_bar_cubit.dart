import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/features/home/presentation/views/controller/bottom_nav_nar_controller/bottom_nav_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarNotHaveCartState());
  void addToCartItem() {
    try {
      BackConstants.cart.add(1);
      emit(BottomNavigationBarHaveCartState(BackConstants.cart.length));
    } catch (_) {
      emit(BottomNavigationBarNotHaveCartState());
    }
  }
}
