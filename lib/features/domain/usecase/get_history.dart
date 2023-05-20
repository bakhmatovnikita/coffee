import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../entiti/default_history_entiti.dart/history_order_entiti.dart';
import '../repository/coffe_repository.dart';

class GetHistory extends UseCase<HistoryOrderEntiti, HistoryEndpointParams> {
  final CoffeeRepository coffeeRepository;

  GetHistory(this.coffeeRepository);
  @override
  Future<Either<Failure, HistoryOrderEntiti>> call(
      HistoryEndpointParams params) async {
    return await coffeeRepository.getOrderHistory(
        params.endpoint,  params.organizationIds, params.ordersId);
  }
}

class HistoryEndpointParams extends Equatable {
  final String endpoint;
  final List<String> organizationIds;
  final List<String> ordersId;

  const HistoryEndpointParams({
    required this.endpoint,
    required this.organizationIds,
    required this.ordersId,
  });
  @override
  List<Object?> get props => [endpoint,organizationIds, ordersId];
}
