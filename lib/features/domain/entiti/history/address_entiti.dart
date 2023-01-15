import 'package:cofee/features/domain/entiti/history/external_courier_service_entiti.dart';
import 'package:cofee/features/domain/entiti/history/street_entiti.dart';

class AddressEntiti {
  final StreetEntiti street;
  final String index;
  final String house;
  final String building;
  final String flat;
  final String entrance;
  final String floor;
  final String doorphone;
  final ExternalCourierServiceEntiti region;

  AddressEntiti({
    required this.street,
    required this.index,
    required this.house,
    required this.building,
    required this.flat,
    required this.entrance,
    required this.floor,
    required this.doorphone,
    required this.region,
  });
}
