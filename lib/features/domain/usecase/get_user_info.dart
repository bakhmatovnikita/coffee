import 'package:cofee/core/error/failure.dart';
import 'package:cofee/core/usecase/usecase.dart';
import 'package:cofee/features/domain/entiti/user_info/user_info_entiti.dart';
import 'package:cofee/features/domain/repository/coffe_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetUserInfo extends UseCase<UserInfoEntiti, UserInfoParams> {
  final CoffeeRepository coffeeRepository;

  GetUserInfo({required this.coffeeRepository});

  @override
  Future<Either<Failure, UserInfoEntiti>> call(UserInfoParams params) async {
    return await coffeeRepository.getUserInfo(
        params.endpoint, params.phone, params.organizationId);
  }
}

class UserInfoParams extends Equatable {
  final String phone;
  final String organizationId;
  final String endpoint;

  const UserInfoParams({
    required this.phone,
    required this.organizationId,
    required this.endpoint,
  });
  @override
  List<Object?> get props => [phone, organizationId, endpoint];
}
