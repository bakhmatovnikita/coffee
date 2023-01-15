import 'package:cofee/features/domain/entiti/history/address_entiti.dart';
import 'package:cofee/features/domain/entiti/history/coordinates_entiti.dart';

class DeliveryPointEntiti {
  final CoordinatesEntiti coordinates;
  final AddressEntiti address;
  final String externalCartographyId;
  final String comment;

  DeliveryPointEntiti({
    required this.coordinates,
    required this.address,
    required this.externalCartographyId,
    required this.comment,
  });
}
