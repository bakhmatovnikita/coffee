import 'package:cofee/features/domain/entiti/order_types/order_types_entiti.dart';
import 'package:equatable/equatable.dart';

class OrderTypesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OrderTypesEmptyState extends OrderTypesState {
  @override
  List<Object?> get props => [];
}

class OrderTypesLoadedState extends OrderTypesState {
  final OrderTypesEntiti orderTypesEntiti;

  OrderTypesLoadedState({required this.orderTypesEntiti});
  @override
  List<Object?> get props => [orderTypesEntiti];
}

class OrderTypesErrorState extends OrderTypesState {
  final String message;

  OrderTypesErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
