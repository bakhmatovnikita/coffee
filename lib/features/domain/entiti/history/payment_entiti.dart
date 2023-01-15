import 'package:cofee/features/domain/entiti/history/external_courier_service_entiti.dart';

import 'payment_type.dart';

class PaymentEntiti {
  final PaymentTypeEntiti paymentType;
  final int sum;
  final bool isPreliminary;
  final bool isExternal;
  final bool isProcessedExternally;
  final bool isFiscalizedExternally;
  final ExternalCourierServiceEntiti tipsType;

  PaymentEntiti({
    required this.paymentType,
    required this.sum,
    required this.isPreliminary,
    required this.isExternal,
    required this.isProcessedExternally,
    required this.isFiscalizedExternally,
    required this.tipsType,
  });
}
