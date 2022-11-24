import 'package:cofee/features/auth/presentation/domain/entiti/organization_entiti.dart';

class OrganizationModel extends OrganizationEntiti {
  OrganizationModel({
    required final String responseType,
    required final String country,
    required final String restaurantAddress,
    required final double latitude,
    required final double longitude,
    required final bool useUaeAddressingSystem,
    required final String version,
    required final String currencyIsoName,
    required final int currencyMinimumDenomination,
    required final String countryPhoneCode,
    required final bool marketingSourceRequiredInDelivery,
    required final String defaultDeliveryCityId,
    required final dynamic deliveryCityIds,
    required final String deliveryServiceType,
    required final String defaultCallCenterPaymentTypeId,
    required final bool orderItemCommentEnabled,
    required final String inn,
    required final String addressFormatType,
    required final bool isConfirmationEnabled,
    required final int confirmAllowedIntervalInMinutes,
    required final bool isCloud,
    required final bool isAnonymousGuestsAllowed,
    required final List<dynamic> addressLookup,
    required final String id,
    required final String name,
  }) : super(
          responseType: responseType,
          country: country,
          restaurantAddress: restaurantAddress,
          latitude: latitude,
          longitude: longitude,
          useUaeAddressingSystem: useUaeAddressingSystem,
          version: version,
          currencyIsoName: currencyIsoName,
          currencyMinimumDenomination: currencyMinimumDenomination,
          countryPhoneCode: countryPhoneCode,
          marketingSourceRequiredInDelivery: marketingSourceRequiredInDelivery,
          defaultDeliveryCityId: defaultDeliveryCityId,
          deliveryCityIds: deliveryCityIds,
          deliveryServiceType: deliveryServiceType,
          defaultCallCenterPaymentTypeId: defaultCallCenterPaymentTypeId,
          orderItemCommentEnabled: orderItemCommentEnabled,
          inn: inn,
          addressFormatType: addressFormatType,
          isConfirmationEnabled: isConfirmationEnabled,
          confirmAllowedIntervalInMinutes: confirmAllowedIntervalInMinutes,
          isCloud: isCloud,
          isAnonymousGuestsAllowed: isAnonymousGuestsAllowed,
          addressLookup: addressLookup,
          id: id,
          name: name,
        );
  factory OrganizationModel.fromJson(Map<String, dynamic> json) =>
      OrganizationModel(
        responseType: json["responseType"],
        country: json["country"],
        restaurantAddress: json["restaurantAddress"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        useUaeAddressingSystem: json["useUaeAddressingSystem"],
        version: json["version"],
        currencyIsoName: json["currencyIsoName"],
        currencyMinimumDenomination: json["currencyMinimumDenomination"],
        countryPhoneCode: json["countryPhoneCode"],
        marketingSourceRequiredInDelivery: json["marketingSourceRequiredInDelivery"],
        defaultDeliveryCityId: json["defaultDeliveryCityId"],
        deliveryCityIds: json["deliveryCityIds"],
        deliveryServiceType: json["deliveryServiceType"],
        defaultCallCenterPaymentTypeId: json["defaultCallCenterPaymentTypeId"],
        orderItemCommentEnabled: json["orderItemCommentEnabled"],
        inn: json["inn"],
        addressFormatType: json["addressFormatType"],
        isConfirmationEnabled: json["isConfirmationEnabled"],
        confirmAllowedIntervalInMinutes: json["confirmAllowedIntervalInMinutes"],
        isCloud: json["isCloud"],
        isAnonymousGuestsAllowed: json["isAnonymousGuestsAllowed"],
        addressLookup: List<dynamic>.from(json["addressLookup"].map((x) => x)),
        id: json["id"],
        name: json["name"],
      );
}
