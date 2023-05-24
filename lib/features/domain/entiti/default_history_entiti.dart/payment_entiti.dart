



import 'package:cofee/features/domain/entiti/default_history_entiti.dart/payment_type_entiti.dart';

class PaymentEntiti {
  final PaymentTypeEntiti paymentType;
  final double sum;
  final bool isPreliminary;
  final bool isExternal;
  final bool isProcessedExternally;
  final bool isFiscalizedExternally;
  final bool isPrepay;

  PaymentEntiti({
    required this.paymentType,
    required this.sum,
    required this.isPreliminary,
    required this.isExternal,
    required this.isProcessedExternally,
    required this.isFiscalizedExternally,
    required this.isPrepay,
  });
}
