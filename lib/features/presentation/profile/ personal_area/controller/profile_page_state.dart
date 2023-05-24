import 'package:cofee/features/domain/entiti/organizations_entiti.dart';
import 'package:cofee/features/domain/entiti/user_info/user_info_entiti.dart';
import 'package:equatable/equatable.dart';

class ProfilePageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfilePageEmptyState extends ProfilePageState {
  @override
  List<Object?> get props => [];
}

class ProfileLoadingState extends ProfilePageState {
  @override
  List<Object?> get props => [];
}

class ProfilePageLoadedState extends ProfilePageState {
  final OrganizationsEntiti organizationsEntiti;
  final UserInfoEntiti userInfoEntiti;

  ProfilePageLoadedState(
      {required this.organizationsEntiti, required this.userInfoEntiti});
  @override
  List<Object?> get props => [organizationsEntiti, userInfoEntiti];
}

class ProfilePageErrorState extends ProfilePageState {
  final String message;

  ProfilePageErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
