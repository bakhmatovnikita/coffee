import 'package:cofee/features/domain/entiti/history/combo_information_entiti.dart';
import 'package:cofee/features/domain/entiti/history/deleted_entiti.dart';
import 'package:cofee/features/domain/entiti/history/external_courier_service_entiti.dart';

class ItemEntiti {
  final String type;
  final String status;
  final DeletedEntiti deleted;
  final int amount;
  final String comment;
  final DateTime whenPrinted;
  final ExternalCourierServiceEntiti size;
  final ComboInformationEntiti comboInformation;

  ItemEntiti({
    required this.type,
    required this.status,
    required this.deleted,
    required this.amount,
    required this.comment,
    required this.whenPrinted,
    required this.size,
    required this.comboInformation,
  });
}
