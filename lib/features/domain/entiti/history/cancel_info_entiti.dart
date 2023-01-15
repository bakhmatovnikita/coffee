import 'package:cofee/features/domain/entiti/history/external_courier_service_entiti.dart';

class CancelInfoEntiti {
  final DateTime whenCancelled;
  final ExternalCourierServiceEntiti cause;
  final String comment;

  CancelInfoEntiti({
    required this.whenCancelled,
    required this.cause,
    required this.comment,
  });
}
