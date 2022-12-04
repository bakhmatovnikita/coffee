import 'package:cofee/core/error/failure.dart';
import 'package:cofee/core/usecase/usecase.dart';
import 'package:cofee/features/domain/entiti/products/products_entiti.dart';
import 'package:cofee/features/domain/repository/coffe_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetProducts extends UseCase<ProductsEntiti, ProductsEndpointParams> {
  final CoffeeRepository coffeeRepository;

  GetProducts(this.coffeeRepository);
  @override
  Future<Either<Failure, ProductsEntiti>> call(
      ProductsEndpointParams params) async {
    return await coffeeRepository.getProducts(params.endpoint);
  }
}

class ProductsEndpointParams extends Equatable {
  final String endpoint;

  const ProductsEndpointParams({
    required this.endpoint,
  });
  @override
  List<Object?> get props => [endpoint];
}
