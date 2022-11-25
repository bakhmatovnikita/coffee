
import 'package:cofee/features/auth/presentation/domain/entiti/organizations_entiti.dart';
import 'package:equatable/equatable.dart';

abstract class ChoiceAdressState extends Equatable{
 @override
  List<Object?> get props => [];
}

class ChoiceAdressEmptyState extends ChoiceAdressState{
  @override
  List<Object?> get props => [];
}

class ChoiceAdressLoadedState extends ChoiceAdressState{
  final OrganizationsEntiti organizationsEntiti;

  ChoiceAdressLoadedState(this.organizationsEntiti);
  @override
  List<Object?> get props => [organizationsEntiti];
}

class ChoiceAdressErrorState extends ChoiceAdressState{
  final String message;

  ChoiceAdressErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}