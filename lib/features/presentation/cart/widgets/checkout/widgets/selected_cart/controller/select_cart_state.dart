import 'package:equatable/equatable.dart';

import '../../../../../../../domain/entiti/select_cart/select_cart_entiti.dart';

class SelectCartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectCartEmptyState extends SelectCartState {
  @override
  List<Object?> get props => [];
}

class SelectCartLoadedState extends SelectCartState {
  final SelectCartEntiti selectCartEntiti;

  SelectCartLoadedState({required this.selectCartEntiti});

  @override
  List<Object?> get props => [selectCartEntiti];
}

class SelectCartErrorState extends SelectCartState {
  final String message;

  SelectCartErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
