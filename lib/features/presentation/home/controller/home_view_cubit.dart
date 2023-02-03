import 'package:cofee/constants/constants_for_back/constants.dart';
import 'package:cofee/features/domain/usecase/get_products.dart';
import 'package:cofee/features/presentation/home/controller/home_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  final GetProducts getProducts;
  HomeViewCubit({required this.getProducts}) : super(HomeViewEmptyState());

  Future<void> fetchProducts(String endpoint) async {
    try {
      final loadedProductsOrFailure =
          await getProducts.call(ProductsEndpointParams(endpoint: endpoint));
      loadedProductsOrFailure.fold(
        (error) => emit(
          HomeViewErrorState(
            message: BackConstants.SERVER_FAILURE_MESSAGE,
          ),
        ),
        (products) => emit(
          HomeViewLoadedState(products),
        ),
      );
    } catch (_) {
      emit(HomeViewErrorState(message: BackConstants.SERVER_FAILURE_MESSAGE));
    }
  }

  Future<int> getLenthCategory(String endpoint) async {
    final product =
        await getProducts.call(ProductsEndpointParams(endpoint: endpoint));
    return product.fold((l) => 0, (r) => r.groups.length);
  }
}
