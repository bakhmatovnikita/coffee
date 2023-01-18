import 'package:cofee/features/domain/entiti/organizations_entiti.dart';
import 'package:equatable/equatable.dart';

class ProfilePageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfilePageEmptyState extends ProfilePageState {
  @override
  List<Object?> get props => [];
}

class ProfilePageLoadedState extends ProfilePageState {
  final OrganizationsEntiti organizationsEntiti;

  ProfilePageLoadedState(this.organizationsEntiti);
  @override
  List<Object?> get props => [organizationsEntiti];
}

class ProfilePageErrorState extends ProfilePageState {
  final String message;

  ProfilePageErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
