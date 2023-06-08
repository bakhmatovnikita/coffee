import 'package:equatable/equatable.dart';

class LoginViewState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginViewBlankState extends LoginViewState {
  @override
  List<Object?> get props => [];
}

class LoginViewEmptyState extends LoginViewState {
  @override
  List<Object?> get props => [];
}

class LoginViewSavedState extends LoginViewState{
  final String? code;

  LoginViewSavedState(this.code);
  @override
  List<Object?> get props => [];
}
