import 'package:cofee/features/domain/entiti/history/history_entiti.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../repository/coffe_repository.dart';

class GetHistory extends UseCase<HistoryEntiti, HistoryEndpointParams> {
  final CoffeeRepository coffeeRepository;

  GetHistory(this.coffeeRepository);
  @override
  Future<Either<Failure, HistoryEntiti>> call(
      HistoryEndpointParams params) async {
    return await coffeeRepository.getOrderHistory(
        params.endpoint, params.phone, params.organizationIds);
  }
}

class HistoryEndpointParams extends Equatable {
  final String endpoint;
  final String phone;
  final List<String> organizationIds;

  const HistoryEndpointParams({
    required this.endpoint,
    required this.organizationIds,
    required this.phone,
  });
  @override
  List<Object?> get props => [endpoint, phone, organizationIds];
}
