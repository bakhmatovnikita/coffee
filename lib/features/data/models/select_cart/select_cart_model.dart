
import 'package:cofee/features/data/models/select_cart/payment_type_model.dart';
import 'package:cofee/features/domain/entiti/select_cart/select_cart_entiti.dart';

class SelectCartModel extends SelectCartEntiti {
  SelectCartModel({
    required final String correlationId,
    required final List<PaymentTypeModel> paymentTypes,
  }) : super(
          correlationId: correlationId,
          paymentTypes: paymentTypes,
        );
  factory SelectCartModel.fromJson(Map<String, dynamic> json) =>
      SelectCartModel(
        correlationId: json["correlationId"]??'',
        paymentTypes: List<PaymentTypeModel>.from(
            json["paymentTypes"].map((x) => PaymentTypeModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "correlationId": correlationId,
        "paymentTypes": paymentTypes,
      };
}
