import 'package:cofee/features/auth/presentation/domain/entiti/token_entiti.dart';
import 'package:equatable/equatable.dart';

class HomePageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomePageEmptyTokenState extends HomePageState {
  @override
  List<Object?> get props => [];
}

class HomePageLoadedTokenState extends HomePageState {
  final TokenEntiti tokenEntiti;

  HomePageLoadedTokenState(this.tokenEntiti);
  @override
  List<Object?> get props => [tokenEntiti];
}

class HomePageErrorTokenState extends HomePageState {
  final String message;

  HomePageErrorTokenState(this.message);
  @override
  List<Object?> get props => [message];
}
