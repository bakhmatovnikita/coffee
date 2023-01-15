import 'package:cofee/features/domain/entiti/history/external_courier_service_entiti.dart';

class DeletionMethodEntiti {
  final String id;
  final String comment;
  final ExternalCourierServiceEntiti removalType;

  DeletionMethodEntiti({
    required this.id,
    required this.comment,
    required this.removalType,
  });
}
