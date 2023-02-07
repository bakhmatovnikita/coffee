import 'package:cofee/features/domain/entiti/select_cart/payment_type_entiti.dart';

class SelectCartEntiti {
  final String correlationId;
  final List<PaymentTypeEntiti> paymentTypes;

  SelectCartEntiti({
    required this.correlationId,
    required this.paymentTypes,
  });
}
