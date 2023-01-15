import 'package:cofee/features/domain/entiti/history/external_courier_service_entiti.dart';

class DiscountEntiti {
  final ExternalCourierServiceEntiti discountType;
  final int sum;
  final List<String> selectivePositions;

  DiscountEntiti({
    required this.discountType,
    required this.sum,
    required this.selectivePositions,
  });
}
