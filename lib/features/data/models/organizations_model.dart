import 'package:cofee/features/data/models/organization_model.dart';
import 'package:cofee/features/domain/entiti/organization_entiti.dart';
import 'package:cofee/features/domain/entiti/organizations_entiti.dart';

class OrganizationsModel extends OrganizationsEntiti {
  OrganizationsModel({
    required final List<OrganizationEntiti> organizations,
  }) : super(
          organizations: organizations,
        );
  factory OrganizationsModel.fromJson(Map<String, dynamic> json) =>
      OrganizationsModel(
        organizations: List<OrganizationEntiti>.from(
          (json["organizations"] as List<dynamic>)
              .map((x) => OrganizationModel.fromJson(x))
              .toList(),
        ),
      );
}
