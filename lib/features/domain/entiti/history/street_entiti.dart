import 'package:cofee/features/domain/entiti/history/external_courier_service_entiti.dart';

class StreetEntiti {
  final String id;
  final String name;
  final ExternalCourierServiceEntiti city;

  StreetEntiti({
    required this.id,
    required this.name,
    required this.city,
  });
}
