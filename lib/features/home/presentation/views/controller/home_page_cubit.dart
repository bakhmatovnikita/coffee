import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/features/auth/presentation/domain/usecase/get_token.dart';
import 'package:cofee/features/home/presentation/views/controller/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final GetToken getToken;
  HomePageCubit({required this.getToken}) : super(HomePageEmptyTokenState());

  Future<void> getLoginToken(String endpoint) async {
    try {
      final loadedTokenOrFailure =
          await getToken.call(EndpointTokenParams(endpoint: endpoint));
      loadedTokenOrFailure.fold(
          (error) => emit(
              HomePageErrorTokenState(BackConstants.SERVER_FAILURE_MESSAGE)),
          (tokenModel) => emit(HomePageLoadedTokenState(tokenModel)));
    } catch (_) {
      return emit(
          HomePageErrorTokenState(BackConstants.SERVER_FAILURE_MESSAGE));
    }
  }
}
