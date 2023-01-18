import 'package:cofee/features/domain/entiti/user_id_entiti.dart';
import 'package:equatable/equatable.dart';

class EditProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EditProfileEmptyState extends EditProfileState {
  @override
  List<Object?> get props => [];
}

class EditProfileSucessState extends EditProfileState {
  final UserIdEntiti userIdEntiti;

  EditProfileSucessState(this.userIdEntiti);
  @override
  List<Object?> get props => [userIdEntiti];
}

class EditProfileNotSucessState extends EditProfileState {
  final String message;

  EditProfileNotSucessState(this.message);

  @override
  List<Object?> get props => [message];
}
