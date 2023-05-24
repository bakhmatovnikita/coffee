

import 'package:cofee/features/data/models/default_history_model.dart/payment_type_model.dart';

import '../../../domain/entiti/default_history_entiti.dart/payment_entiti.dart';
import '../../../domain/entiti/default_history_entiti.dart/payment_type_entiti.dart';

class PaymentModel extends PaymentEntiti {
  PaymentModel({
    required final PaymentTypeEntiti paymentType,
    required final double sum,
    required final bool isPreliminary,
    required final bool isExternal,
    required final bool isProcessedExternally,
    required final bool isFiscalizedExternally,
    required final bool isPrepay,
  }) : super(
          paymentType: paymentType,
          sum: sum,
          isPreliminary: isPreliminary,
          isExternal: isExternal,
          isProcessedExternally: isProcessedExternally,
          isFiscalizedExternally: isFiscalizedExternally,
          isPrepay: isPrepay,
        );
  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        paymentType: PaymentTypeModel.fromJson(json["paymentType"]),
        sum: json["sum"],
        isPreliminary: json["isPreliminary"],
        isExternal: json["isExternal"],
        isProcessedExternally: json["isProcessedExternally"],
        isFiscalizedExternally: json["isFiscalizedExternally"],
        isPrepay: json["isPrepay"],
      );

  Map<String, dynamic> toJson() => {
        "paymentType": paymentType,
        "sum": sum,
        "isPreliminary": isPreliminary,
        "isExternal": isExternal,
        "isProcessedExternally": isProcessedExternally,
        "isFiscalizedExternally": isFiscalizedExternally,
        "isPrepay": isPrepay,
      };
}
