import 'dart:math';

import 'package:cofee/core/error/exception.dart';
import 'package:cofee/features/data/datasorces/local_datasource/local_datasource.dart';
import 'package:cofee/features/domain/usecase/get_token.dart';
import 'package:cofee/features/domain/usecase/send_sms.dart';
import 'package:cofee/features/presentation/auth/login_view/controller/login_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewCubit extends Cubit<LoginViewState>{
  final GetToken getToken;
  final SendMsg sendMsg;
  final LocalDatasource localDatasource;
  LoginViewCubit({required this.getToken, required this.localDatasource, required this.sendMsg}):super(LoginViewEmptyState());
  Future<void> saveToken(String endpoint) async {
    emit(LoginViewBlankState());
    try {
      await getToken.call(EndpointTokenParams(endpoint: endpoint));
      emit(LoginViewSavedState(null));
    } catch (e) {
      throw CacheException();
    }
  }
   Future<void> sendSms(String phone) async {
    emit(LoginViewBlankState());
    try {
      int value = Random().nextInt(100001) + 100000;
      final reault = await sendMsg.call(SmsParams(msg: value.toString(), phone: phone));
      
       emit(LoginViewSavedState(value.toString()));
     
    } catch (e) {
      throw CacheException();
    }
  }
 
}