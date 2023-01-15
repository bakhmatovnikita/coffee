import 'package:cofee/features/domain/entiti/history/payment_type.dart';

class PaymentTypeModel extends PaymentTypeEntiti {
  PaymentTypeModel({
    required final String id,
    required final String name,
    required final String kind,
  }) : super(
          id: id,
          name: name,
          kind: kind,
        );
  factory PaymentTypeModel.fromJson(Map<String, dynamic> json) =>
      PaymentTypeModel(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        kind: json["kind"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "kind": kind,
      };
}
