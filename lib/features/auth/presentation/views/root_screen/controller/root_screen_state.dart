import 'package:equatable/equatable.dart';

class RootScreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RootScreenIsAuthorized extends RootScreenState {
  @override
  List<Object?> get props => [];
}

class RootScreenUnauthorized extends RootScreenState {
  @override
  List<Object?> get props => [];
}

class RootScreenTokenUnauthorized extends RootScreenState {
  @override
  List<Object?> get props => [];
}

class RootScreenEmptyState extends RootScreenState{
  @override
  List<Object?> get props => [];
}

class RootScreenError extends RootScreenState {
  final String message;

  RootScreenError({required this.message});
  @override
  List<Object?> get props => [message];
}
