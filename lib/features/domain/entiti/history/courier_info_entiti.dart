import 'package:cofee/features/domain/entiti/history/operator_entiti.dart';

class CourierInfoEntiti {
  final OperatorEntiti courier;
  final bool isCourierSelectedManually;

  CourierInfoEntiti({
    required this.courier,
    required this.isCourierSelectedManually,
  });
}
