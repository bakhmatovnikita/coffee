import 'package:cofee/features/domain/entiti/user_info/card_entiti.dart';
import 'package:cofee/features/domain/entiti/user_info/category_entiti.dart';
import 'package:cofee/features/domain/entiti/user_info/wallet_balance_entiti.dart';

class UserInfoEntiti {
  final String id;
  final String referrerId;
  final String name;
  final String surname;
  final String middleName;
  final String comment;
  final String phone;
  final String cultureName;
  final DateTime birthday;
  final String email;
  final int sex;
  final int consentStatus;
  final bool anonymized;
  final List<CardEntiti> cards;
  final List<CategoryEntiti> categories;
  final List<WalletBalanceEntiti> walletBalances;
  final String userData;
  final bool shouldReceivePromoActionsInfo;
  final bool shouldReceiveLoyaltyInfo;
  final bool shouldReceiveOrderStatusInfo;
  final DateTime personalDataConsentFrom;
  final DateTime personalDataConsentTo;
  final DateTime personalDataProcessingFrom;
  final DateTime personalDataProcessingTo;
  final bool isDeleted;

  UserInfoEntiti({
    required this.id,
    required this.referrerId,
    required this.name,
    required this.surname,
    required this.middleName,
    required this.comment,
    required this.phone,
    required this.cultureName,
    required this.birthday,
    required this.email,
    required this.sex,
    required this.consentStatus,
    required this.anonymized,
    required this.cards,
    required this.categories,
    required this.walletBalances,
    required this.userData,
    required this.shouldReceivePromoActionsInfo,
    required this.shouldReceiveLoyaltyInfo,
    required this.shouldReceiveOrderStatusInfo,
    required this.personalDataConsentFrom,
    required this.personalDataConsentTo,
    required this.personalDataProcessingFrom,
    required this.personalDataProcessingTo,
    required this.isDeleted,
  });
}
