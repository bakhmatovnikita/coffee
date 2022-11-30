import 'package:cofee/features/auth/presentation/domain/entiti/products/price_entiti.dart';

class PriceModels extends PriceEntiti {
  PriceModels({
    required final int currentPrice,
  }) : super(
          currentPrice: currentPrice,
        );
  factory PriceModels.fromJson(Map<String, dynamic> json) =>
      PriceModels(currentPrice: json['currentPrice'] ?? 0);
}
