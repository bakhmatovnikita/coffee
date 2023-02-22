import 'package:cofee/features/data/models/user_info/card_model.dart';
import 'package:cofee/features/data/models/user_info/category_model.dart';
import 'package:cofee/features/data/models/user_info/wallet_balance_model.dart';
import 'package:cofee/features/domain/entiti/user_info/category_entiti.dart';
import 'package:cofee/features/domain/entiti/user_info/wallet_balance_entiti.dart';

import '../../../domain/entiti/user_info/card_entiti.dart';
import '../../../domain/entiti/user_info/user_info_entiti.dart';

class UserInfoModel extends UserInfoEntiti {
  UserInfoModel({
    required final String id,
    required final String referrerId,
    required final String name,
    required final String surname,
    required final String middleName,
    required final String comment,
    required final String phone,
    required final String cultureName,
    required final DateTime birthday,
    required final String email,
    required final int sex,
    required final int consentStatus,
    required final bool anonymized,
    required final List<CardEntiti> cards,
    required final List<CategoryEntiti> categories,
    required final List<WalletBalanceEntiti> walletBalances,
    required final String userData,
    required final bool shouldReceivePromoActionsInfo,
    required final bool shouldReceiveLoyaltyInfo,
    required final bool shouldReceiveOrderStatusInfo,
    required final DateTime personalDataConsentFrom,
    required final DateTime personalDataConsentTo,
    required final DateTime personalDataProcessingFrom,
    required final DateTime personalDataProcessingTo,
    required final bool isDeleted,
  }) : super(
          id: id,
          referrerId: referrerId,
          name: name,
          surname: surname,
          middleName: middleName,
          comment: comment,
          phone: phone,
          cultureName: cultureName,
          birthday: birthday,
          email: email,
          sex: sex,
          consentStatus: consentStatus,
          anonymized: anonymized,
          cards: cards,
          categories: categories,
          walletBalances: walletBalances,
          userData: userData,
          shouldReceivePromoActionsInfo: shouldReceivePromoActionsInfo,
          shouldReceiveLoyaltyInfo: shouldReceiveLoyaltyInfo,
          shouldReceiveOrderStatusInfo: shouldReceiveOrderStatusInfo,
          personalDataConsentFrom: personalDataConsentFrom,
          personalDataConsentTo: personalDataConsentTo,
          personalDataProcessingFrom: personalDataProcessingFrom,
          personalDataProcessingTo: personalDataProcessingTo,
          isDeleted: isDeleted,
        );
  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        id: json["id"],
        referrerId: json["referrerId"],
        name: json["name"],
        surname: json["surname"],
        middleName: json["middleName"],
        comment: json["comment"],
        phone: json["phone"],
        cultureName: json["cultureName"],
        birthday: DateTime.parse(json["birthday"]),
        email: json["email"],
        sex: json["sex"],
        consentStatus: json["consentStatus"],
        anonymized: json["anonymized"],
        cards: List<CardEntiti>.from(
            json["cards"].map((x) => CardModel.fromJson(x))),
        categories: List<CategoryEntiti>.from(
            json["categories"].map((x) => CategoryModel.fromJson(x))),
        walletBalances: List<WalletBalanceEntiti>.from(
            json["walletBalances"].map((x) => WalletBalanceModel.fromJson(x))),
        userData: json["userData"],
        shouldReceivePromoActionsInfo: json["shouldReceivePromoActionsInfo"],
        shouldReceiveLoyaltyInfo: json["shouldReceiveLoyaltyInfo"],
        shouldReceiveOrderStatusInfo: json["shouldReceiveOrderStatusInfo"],
        personalDataConsentFrom:
            DateTime.parse(json["personalDataConsentFrom"]),
        personalDataConsentTo: DateTime.parse(json["personalDataConsentTo"]),
        personalDataProcessingFrom:
            DateTime.parse(json["personalDataProcessingFrom"]),
        personalDataProcessingTo:
            DateTime.parse(json["personalDataProcessingTo"]),
        isDeleted: json["isDeleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "referrerId": referrerId,
        "name": name,
        "surname": surname,
        "middleName": middleName,
        "comment": comment,
        "phone": phone,
        "cultureName": cultureName,
        "birthday": birthday.toIso8601String(),
        "email": email,
        "sex": sex,
        "consentStatus": consentStatus,
        "anonymized": anonymized,
        "cards": cards,
        "categories": categories,
        "walletBalances": walletBalances,
        "userData": userData,
        "shouldReceivePromoActionsInfo": shouldReceivePromoActionsInfo,
        "shouldReceiveLoyaltyInfo": shouldReceiveLoyaltyInfo,
        "shouldReceiveOrderStatusInfo": shouldReceiveOrderStatusInfo,
        "personalDataConsentFrom": personalDataConsentFrom.toIso8601String(),
        "personalDataConsentTo": personalDataConsentTo.toIso8601String(),
        "personalDataProcessingFrom":
            personalDataProcessingFrom.toIso8601String(),
        "personalDataProcessingTo": personalDataProcessingTo.toIso8601String(),
        "isDeleted": isDeleted,
      };
}
