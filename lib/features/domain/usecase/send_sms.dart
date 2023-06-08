import 'package:cofee/core/error/failure.dart';
import 'package:cofee/core/usecase/usecase.dart';
import 'package:cofee/features/domain/entiti/sms_entiti/sms_entiti.dart';
import 'package:cofee/features/domain/repository/coffe_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SendMsg extends UseCase<SmsEntiti, SmsParams> {
  final CoffeeRepository coffeeRepository;

  SendMsg({required this.coffeeRepository});
  @override
  Future<Either<Failure, SmsEntiti>> call(SmsParams params) async {
    return await coffeeRepository.getSms(params.phone, params.msg);
  }
}

class SmsParams extends Equatable {
  final String msg;
  final String phone;

  const SmsParams({required this.msg, required this.phone});
  @override
  List<Object?> get props => [msg, phone];
}
