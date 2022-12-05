import 'package:cofee/core/error/exception.dart';
import 'package:cofee/features/domain/usecase/get_token.dart';
import 'package:cofee/features/presentation/auth/login_view/controller/login_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewCubit extends Cubit<LoginViewState>{
  final GetToken getToken;
  LoginViewCubit({required this.getToken}):super(LoginViewEmptyState());
  Future<void> saveToken(String endpoint) async {
    try {
      getToken.call(EndpointTokenParams(endpoint: endpoint));
      emit(LoginViewSavedState());
    } catch (e) {
      throw CacheException();
    }
  }
}