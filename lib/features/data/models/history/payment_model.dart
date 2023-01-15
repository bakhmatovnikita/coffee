import 'package:cofee/features/data/models/history/external_courier_service_model.dart';
import 'package:cofee/features/data/models/history/payment_type_model.dart';
import 'package:cofee/features/domain/entiti/history/external_courier_service_entiti.dart';
import 'package:cofee/features/domain/entiti/history/payment_entiti.dart';
import 'package:cofee/features/domain/entiti/history/payment_type.dart';

class PaymentModel extends PaymentEntiti {
  PaymentModel({
    required final PaymentTypeEntiti paymentType,
    required final int sum,
    required final bool isPreliminary,
    required final bool isExternal,
    required final bool isProcessedExternally,
    required final bool isFiscalizedExternally,
    required final ExternalCourierServiceEntiti tipsType,
  }) : super(
          paymentType: paymentType,
          sum: sum,
          isPreliminary: isPreliminary,
          isExternal: isExternal,
          isProcessedExternally: isProcessedExternally,
          isFiscalizedExternally: isFiscalizedExternally,
          tipsType: tipsType,
        );
  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        paymentType: PaymentTypeModel.fromJson(json["paymentType"]),
        sum: json["sum"] ?? 0,
        isPreliminary: json["isPreliminary"] ?? false,
        isExternal: json["isExternal"] ?? false,
        isProcessedExternally: json["isProcessedExternally"] ?? false,
        isFiscalizedExternally: json["isFiscalizedExternally"] ?? false,
        tipsType: ExternalCourierServiceModel.fromJson(json['tipsType']),
      );

  Map<String, dynamic> toJson() => {
        "paymentType": paymentType,
        "sum": sum,
        "isPreliminary": isPreliminary,
        "isExternal": isExternal,
        "isProcessedExternally": isProcessedExternally,
        "isFiscalizedExternally": isFiscalizedExternally,
        "tipsType": tipsType,
      };
}
