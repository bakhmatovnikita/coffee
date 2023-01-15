import 'package:cofee/features/domain/entiti/history/cancel_info_entiti.dart';
import 'package:cofee/features/domain/entiti/history/combo_entiti.dart';
import 'package:cofee/features/domain/entiti/history/conception_entiti.dart';
import 'package:cofee/features/domain/entiti/history/courier_info_entiti.dart';
import 'package:cofee/features/domain/entiti/history/customer_entiti.dart';
import 'package:cofee/features/domain/entiti/history/delivery_point_entiti.dart';
import 'package:cofee/features/domain/entiti/history/discount_entiti.dart';
import 'package:cofee/features/domain/entiti/history/external_courier_service_entiti.dart';
import 'package:cofee/features/domain/entiti/history/guests_info_entiti.dart';
import 'package:cofee/features/domain/entiti/history/item_entiti.dart';
import 'package:cofee/features/domain/entiti/history/operator_entiti.dart';
import 'package:cofee/features/domain/entiti/history/order_type_entiti.dart';
import 'package:cofee/features/domain/entiti/history/payment_entiti.dart';
import 'package:cofee/features/domain/entiti/history/problem_entiti.dart';

class OrdersOrderEntiti {
  final String parentDeliveryId;
  final CustomerEntiti customer;
  final String phone;
  final DeliveryPointEntiti deliveryPoint;
  final String status;
  final CancelInfoEntiti cancelInfo;
  final CourierInfoEntiti courierInfo;
  final DateTime completeBefore;
  final DateTime whenCreated;
  final DateTime whenConfirmed;
  final DateTime whenPrinted;
  final DateTime whenCookingCompleted;
  final DateTime whenSended;
  final DateTime whenDelivered;
  final String comment;
  final ProblemEntiti problem;
  final OperatorEntiti orderOperator;
  final ExternalCourierServiceEntiti marketingSource;
  final int deliveryDuration;
  final int indexInCourierRoute;
  final DateTime cookingStartTime;
  final bool isDeleted;
  final DateTime whenReceivedByApi;
  final DateTime whenReceivedFromFront;
  final String movedFromDeliveryId;
  final String movedFromTerminalGroupId;
  final String movedFromOrganizationId;
  final ExternalCourierServiceEntiti externalCourierService;
  final String movedToDeliveryId;
  final String movedToTerminalGroupId;
  final String movedToOrganizationId;
  final int sum;
  final int number;
  final String sourceKey;
  final DateTime whenBillPrinted;
  final DateTime whenClosed;
  final ConceptionEntiti conception;
  final GuestsInfoEntiti guestsInfo;
  final List<ItemEntiti> items;
  final List<ComboEntiti> combos;
  final List<PaymentEntiti> payments;
  final List<PaymentEntiti> tips;
  final List<DiscountEntiti> discounts;
  final OrderTypeEntiti orderType;
  final String terminalGroupId;
  final int processedPaymentsSum;

  OrdersOrderEntiti(
      {required this.parentDeliveryId,
      required this.customer,
      required this.phone,
      required this.deliveryPoint,
      required this.status,
      required this.cancelInfo,
      required this.courierInfo,
      required this.completeBefore,
      required this.whenCreated,
      required this.whenConfirmed,
      required this.whenPrinted,
      required this.whenCookingCompleted,
      required this.whenSended,
      required this.whenDelivered,
      required this.comment,
      required this.problem,
      required this.orderOperator,
      required this.marketingSource,
      required this.deliveryDuration,
      required this.indexInCourierRoute,
      required this.cookingStartTime,
      required this.isDeleted,
      required this.whenReceivedByApi,
      required this.whenReceivedFromFront,
      required this.movedFromDeliveryId,
      required this.movedFromTerminalGroupId,
      required this.movedFromOrganizationId,
      required this.externalCourierService,
      required this.movedToDeliveryId,
      required this.movedToTerminalGroupId,
      required this.movedToOrganizationId,
      required this.sum,
      required this.number,
      required this.sourceKey,
      required this.whenBillPrinted,
      required this.whenClosed,
      required this.conception,
      required this.guestsInfo,
      required this.items,
      required this.combos,
      required this.payments,
      required this.tips,
      required this.discounts,
      required this.orderType,
      required this.terminalGroupId,
      required this.processedPaymentsSum});
}
