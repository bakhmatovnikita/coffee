class CartToOrderModel {
  final String organizationId;
  final String terminalGroupId;
  final Order order;

  CartToOrderModel({
    required this.organizationId,
    required this.terminalGroupId,
    required this.order,
  });
  factory CartToOrderModel.fromJson(Map<String, dynamic> json) =>
      CartToOrderModel(
        organizationId: json["organizationId"],
        terminalGroupId: json["terminalGroupId"],
        order: Order.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "organizationId": organizationId,
        "terminalGroupId": terminalGroupId,
        "order": order,
      };
}

class Order {
  final String phone;
  final List<Item> items;

  Order({
    required this.phone,
    required this.items,
  });
  factory Order.fromJson(Map<String, dynamic> json) => Order(
        phone: json["phone"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  final String type;
  final int amount;
  final String productSizeId;
  final String comment;
  final String productId;

  Item({
    required this.type,
    required this.amount,
    required this.productSizeId,
    required this.comment,
    required this.productId,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        type: json["type"],
        amount: json["amount"],
        productSizeId: json["productSizeId"],
        comment: json["comment"],
        productId: json["productId"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "amount": amount,
        "productSizeId": productSizeId,
        "comment": comment,
        "productId": productId,
      };
}
