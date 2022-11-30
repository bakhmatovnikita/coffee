import 'package:cofee/features/auth/presentation/data/models/products/price_models.dart';
import 'package:cofee/features/auth/presentation/domain/entiti/products/price_entiti.dart';
import 'package:cofee/features/auth/presentation/domain/entiti/products/size_price_entiti.dart';

class SizePriceModels extends SizePriceEntiti {
  SizePriceModels({
    required final dynamic sizeId,
    required final PriceEntiti price,
  }) : super(
          sizeId: sizeId,
          price: price,
        );
  factory SizePriceModels.fromJson(Map<String, dynamic> json) =>
      SizePriceModels(
        sizeId: json['sizeId'],
        price: PriceModels.fromJson(json["price"]),
      );
}
