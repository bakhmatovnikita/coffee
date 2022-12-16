import 'package:cofee/features/data/models/order_info_model.dart';
import 'package:cofee/features/domain/entiti/cart/order_entiti.dart';
import 'package:cofee/features/domain/entiti/order_info_entiti.dart';

class OrderModel extends OrderEntiti {
  OrderModel({
    required final String correlationId,
    required final OrderInfoEntiti orderInfo,
  }) : super(
          correlationId: correlationId,
          orderInfo: orderInfo,
        );
  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        correlationId: json["correlationId"],
        orderInfo: OrderInfoModel.fromJson(json["orderInfo"]),
      );
  Map<String, dynamic> toJson() => {
        'correlationId': correlationId,
        'orderInfo': orderInfo,
      };
}
