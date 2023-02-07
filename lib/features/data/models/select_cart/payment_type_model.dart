

import 'package:cofee/features/data/models/select_cart/terminal_group_model.dart';
import 'package:cofee/features/domain/entiti/select_cart/payment_type_entiti.dart';
import 'package:cofee/features/domain/entiti/select_cart/terminal_group_entiti.dart';

class PaymentTypeModel extends PaymentTypeEntiti {
  PaymentTypeModel({
    required final String id,
    required final String code,
    required final String name,
    required final String comment,
    required final bool combinable,
    required final int externalRevision,
    required final List<dynamic> applicableMarketingCampaigns,
    required final bool isDeleted,
    required final bool printCheque,
    required final String paymentProcessingType,
    required final String paymentTypeKind,
    required final List<TerminalGroupCartEntiti> terminalGroups,
  }) : super(
          id: id,
          code: code,
          name: name,
          comment: comment,
          combinable: combinable,
          externalRevision: externalRevision,
          applicableMarketingCampaigns: applicableMarketingCampaigns,
          isDeleted: isDeleted,
          printCheque: printCheque,
          paymentProcessingType: paymentProcessingType,
          paymentTypeKind: paymentTypeKind,
          terminalGroups: terminalGroups,
        );
  factory PaymentTypeModel.fromJson(Map<String, dynamic> json) =>
      PaymentTypeModel(
        id: json["id"] ??'',
        code: json["code"]??'',
        name: json["name"]??'',
        comment: json["comment"]??'',
        combinable: json["combinable"]??'',
        externalRevision: json["externalRevision"]??'',
        applicableMarketingCampaigns: List<dynamic>.from(
            json["applicableMarketingCampaigns"].map((x) => x)),
        isDeleted: json["isDeleted"]??'',
        printCheque: json["printCheque"]??'',
        paymentProcessingType: json["paymentProcessingType"]??'',
        paymentTypeKind: json["paymentTypeKind"]??'',
        terminalGroups: List<TerminalGroupModel>.from(
            json["terminalGroups"].map((x) => TerminalGroupModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "comment": comment,
        "combinable": combinable,
        "externalRevision": externalRevision,
        "applicableMarketingCampaigns": applicableMarketingCampaigns,
        "isDeleted": isDeleted,
        "printCheque": printCheque,
        "paymentProcessingType": paymentProcessingType,
        "paymentTypeKind": paymentTypeKind,
        "terminalGroups": terminalGroups
      };
}
