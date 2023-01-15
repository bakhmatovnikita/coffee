import 'package:cofee/features/domain/entiti/history/combo_entiti.dart';

class ComboModel extends ComboEntiti {
  ComboModel({
    required final String id,
    required final String name,
    required final int amount,
    required final int price,
    required final String sourceId,
  }) : super(
          id: id,
          name: name,
          amount: amount,
          price: price,
          sourceId: sourceId,
        );
  factory ComboModel.fromJson(Map<String, dynamic> json) => ComboModel(
        id: json["id"],
        name: json["name"],
        amount: json["amount"],
        price: json["price"],
        sourceId: json["sourceId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "amount": amount,
        "price": price,
        "sourceId": sourceId,
      };
}
