import 'size_price_entiti.dart';

class ProductEntiti {
  final double fatAmount;
  final double proteinsAmount;
  final double carbohydratesAmount;
  final double energyAmount;
  final double fatFullAmount;
  final double proteinsFullAmount;
  final double carbohydratesFullAmount;
  final double energyFullAmount;
  final double weight;
  final List<SizePriceEntiti> sizePrices;
  final String name;
  final List<String> imageLink;
  final String parentGroup;
  final String id;
  ProductEntiti({
    required this.fatAmount,
    required this.proteinsAmount,
    required this.carbohydratesAmount,
    required this.energyAmount,
    required this.fatFullAmount,
    required this.proteinsFullAmount,
    required this.carbohydratesFullAmount,
    required this.energyFullAmount,
    required this.weight,
    required this.sizePrices,
    required this.name,
    required this.imageLink,
    required this.parentGroup,
    required this.id,
  });
}
