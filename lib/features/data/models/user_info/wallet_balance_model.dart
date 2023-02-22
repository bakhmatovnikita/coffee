import '../../../domain/entiti/user_info/wallet_balance_entiti.dart';

class WalletBalanceModel extends WalletBalanceEntiti {
  WalletBalanceModel({
    required final String id,
    required final String name,
    required final int type,
    required final int balance,
  }) : super(
          id: id,
          name: name,
          type: type,
          balance: balance,
        );
  factory WalletBalanceModel.fromJson(Map<String, dynamic> json) => WalletBalanceModel(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "balance": balance,
      };
}
