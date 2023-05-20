import 'package:cofee/features/domain/entiti/select_cart/terminal_group_entiti.dart';

class PaymentTypeEntiti {
  final String id;
  final String code;
  final String name;
  final String comment;
  final bool combinable;
  final int externalRevision;
  final List<dynamic> applicableMarketingCampaigns;
  final bool isDeleted;
  final bool printCheque;
  final String paymentProcessingType;
  final String paymentTypeKind;
  final List<TerminalGroupCartEntiti> terminalGroups;

  PaymentTypeEntiti({
    required this.id,
    required this.code,
    required this.name,
    required this.comment,
    required this.combinable,
    required this.externalRevision,
    required this.applicableMarketingCampaigns,
    required this.isDeleted,
    required this.printCheque,
    required this.paymentProcessingType,
    required this.paymentTypeKind,
    required this.terminalGroups,
  });
}
