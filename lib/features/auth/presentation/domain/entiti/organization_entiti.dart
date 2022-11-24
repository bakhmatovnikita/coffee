class OrganizationEntiti {
  final String responseType;
  final String country;
  final String restaurantAddress;
  final double latitude;
  final double longitude;
  final bool useUaeAddressingSystem;
  final String version;
  final String currencyIsoName;
  final int currencyMinimumDenomination;
  final String countryPhoneCode;
  final bool marketingSourceRequiredInDelivery;
  final String defaultDeliveryCityId;
  final dynamic deliveryCityIds;
  final String deliveryServiceType;
  final String defaultCallCenterPaymentTypeId;
  final bool orderItemCommentEnabled;
  final String inn;
  final String addressFormatType;
  final bool isConfirmationEnabled;
  final int confirmAllowedIntervalInMinutes;
  final bool isCloud;
  final bool isAnonymousGuestsAllowed;
  final List<dynamic> addressLookup;
  final String id;
  final String name;

  OrganizationEntiti({
    required this.responseType,
    required this.country,
    required this.restaurantAddress,
    required this.latitude,
    required this.longitude,
    required this.useUaeAddressingSystem,
    required this.version,
    required this.currencyIsoName,
    required this.currencyMinimumDenomination,
    required this.countryPhoneCode,
    required this.marketingSourceRequiredInDelivery,
    required this.defaultDeliveryCityId,
    required this.deliveryCityIds,
    required this.deliveryServiceType,
    required this.defaultCallCenterPaymentTypeId,
    required this.orderItemCommentEnabled,
    required this.inn,
    required this.addressFormatType,
    required this.isConfirmationEnabled,
    required this.confirmAllowedIntervalInMinutes,
    required this.isCloud,
    required this.isAnonymousGuestsAllowed,
    required this.addressLookup,
    required this.id,
    required this.name,
  });
}
