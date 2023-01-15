import 'package:cofee/features/domain/entiti/history/customer_entiti.dart';

class CustomerModel extends CustomerEntiti {
  CustomerModel({
    required final String type,
  }) : super(
          type: type,
        );
  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
      };
}
