import 'package:cofee/features/domain/entiti/products/price_entiti.dart';

class PriceModels extends PriceEntiti {
  PriceModels({
    required final double currentPrice,
  }) : super(
          currentPrice: currentPrice,
        );
  factory PriceModels.fromJson(Map<String, dynamic> json) =>
      PriceModels(currentPrice: json['currentPrice'] ?? 0);
}
