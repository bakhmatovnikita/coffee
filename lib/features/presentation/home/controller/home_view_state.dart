import 'package:cofee/features/domain/entiti/products/products_entiti.dart';
import 'package:equatable/equatable.dart';

abstract class HomeViewState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeViewEmptyState extends HomeViewState {
  @override
  List<Object?> get props => [];
}

class HomeViewLoadedState extends HomeViewState{
  final ProductsEntiti productsEntiti;

  HomeViewLoadedState(this.productsEntiti);
  @override
  List<Object?> get props => [productsEntiti];
}

class HomeViewErrorState extends HomeViewState{
  final String message;

  HomeViewErrorState({required this.message});
  @override
  List<Object?> get props => [message];

}