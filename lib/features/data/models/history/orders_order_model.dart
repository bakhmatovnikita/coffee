import 'package:cofee/features/data/models/history/discount_model.dart';
import 'package:cofee/features/data/models/history/payment_model.dart';
import 'package:cofee/features/data/models/history/problem_model.dart';
import 'package:cofee/features/domain/entiti/history/orders_order_entiti.dart';

import '../../../domain/entiti/history/cancel_info_entiti.dart';
import '../../../domain/entiti/history/combo_entiti.dart';
import '../../../domain/entiti/history/conception_entiti.dart';
import '../../../domain/entiti/history/courier_info_entiti.dart';
import '../../../domain/entiti/history/customer_entiti.dart';
import '../../../domain/entiti/history/delivery_point_entiti.dart';
import '../../../domain/entiti/history/discount_entiti.dart';
import '../../../domain/entiti/history/external_courier_service_entiti.dart';
import '../../../domain/entiti/history/guests_info_entiti.dart';
import '../../../domain/entiti/history/item_entiti.dart';
import '../../../domain/entiti/history/operator_entiti.dart';
import '../../../domain/entiti/history/order_type_entiti.dart';
import '../../../domain/entiti/history/payment_entiti.dart';
import '../../../domain/entiti/history/problem_entiti.dart';
import 'cancel_info_model.dart';
import 'combo_model.dart';
import 'conception_model.dart';
import 'courier_info_model.dart';
import 'customer_model.dart';
import 'delivery_point_model.dart';
import 'external_courier_service_model.dart';
import 'guests_info_model.dart';
import 'item_model.dart';
import 'operator_model.dart';
import 'order_type_model.dart';

class OrdersOrderModel extends OrdersOrderEntiti {
  OrdersOrderModel({
    required final String parentDeliveryId,
    required final CustomerEntiti customer,
    required final String phone,
    required final DeliveryPointEntiti deliveryPoint,
    required final String status,
    required final CancelInfoEntiti cancelInfo,
    required final CourierInfoEntiti courierInfo,
    required final DateTime completeBefore,
    required final DateTime whenCreated,
    required final DateTime whenConfirmed,
    required final DateTime whenPrinted,
    required final DateTime whenCookingCompleted,
    required final DateTime whenSended,
    required final DateTime whenDelivered,
    required final String comment,
    required final ProblemEntiti problem,
    required final OperatorEntiti orderOperator,
    required final ExternalCourierServiceEntiti marketingSource,
    required final int deliveryDuration,
    required final int indexInCourierRoute,
    required final DateTime cookingStartTime,
    required final bool isDeleted,
    required final DateTime whenReceivedByApi,
    required final DateTime whenReceivedFromFront,
    required final String movedFromDeliveryId,
    required final String movedFromTerminalGroupId,
    required final String movedFromOrganizationId,
    required final ExternalCourierServiceEntiti externalCourierService,
    required final String movedToDeliveryId,
    required final String movedToTerminalGroupId,
    required final String movedToOrganizationId,
    required final int sum,
    required final int number,
    required final String sourceKey,
    required final DateTime whenBillPrinted,
    required final DateTime whenClosed,
    required final ConceptionEntiti conception,
    required final GuestsInfoEntiti guestsInfo,
    required final List<ItemEntiti> items,
    required final List<ComboEntiti> combos,
    required final List<PaymentEntiti> payments,
    required final List<PaymentEntiti> tips,
    required final List<DiscountEntiti> discounts,
    required final OrderTypeEntiti orderType,
    required final String terminalGroupId,
    required final int processedPaymentsSum,
  }) : super(
          parentDeliveryId: parentDeliveryId,
          customer: customer,
          phone: phone,
          deliveryPoint: deliveryPoint,
          status: status,
          cancelInfo: cancelInfo,
          courierInfo: courierInfo,
          completeBefore: completeBefore,
          whenCreated: whenCreated,
          whenConfirmed: whenConfirmed,
          whenPrinted: whenPrinted,
          whenCookingCompleted: whenCookingCompleted,
          whenSended: whenSended,
          whenDelivered: whenDelivered,
          comment: comment,
          problem: problem,
          orderOperator: orderOperator,
          marketingSource: marketingSource,
          deliveryDuration: deliveryDuration,
          indexInCourierRoute: indexInCourierRoute,
          cookingStartTime: cookingStartTime,
          isDeleted: isDeleted,
          whenReceivedByApi: whenReceivedByApi,
          whenReceivedFromFront: whenReceivedFromFront,
          movedFromDeliveryId: movedFromDeliveryId,
          movedFromTerminalGroupId: movedFromTerminalGroupId,
          movedFromOrganizationId: movedFromOrganizationId,
          externalCourierService: externalCourierService,
          movedToDeliveryId: movedToDeliveryId,
          movedToTerminalGroupId: movedToTerminalGroupId,
          movedToOrganizationId: movedToOrganizationId,
          sum: sum,
          number: number,
          sourceKey: sourceKey,
          whenBillPrinted: whenBillPrinted,
          whenClosed: whenClosed,
          conception: conception,
          guestsInfo: guestsInfo,
          items: items,
          combos: combos,
          payments: payments,
          tips: tips,
          discounts: discounts,
          orderType: orderType,
          terminalGroupId: terminalGroupId,
          processedPaymentsSum: processedPaymentsSum,
        );
  factory OrdersOrderModel.fromJson(Map<String, dynamic> json) =>
      OrdersOrderModel(
        parentDeliveryId: json["parentDeliveryId"],
        customer: CustomerModel.fromJson(json["customer"]),
        phone: json["phone"],
        deliveryPoint: DeliveryPointModel.fromJson(json["deliveryPoint"]),
        status: json["status"],
        cancelInfo: CancelInfoModel.fromJson(json["cancelInfo"]),
        courierInfo: CourierInfoModel.fromJson(json["courierInfo"]),
        completeBefore: DateTime.parse(json["completeBefore"]),
        whenCreated: DateTime.parse(json["whenCreated"]),
        whenConfirmed: DateTime.parse(json["whenConfirmed"]),
        whenPrinted: DateTime.parse(json["whenPrinted"]),
        whenCookingCompleted: DateTime.parse(json["whenCookingCompleted"]),
        whenSended: DateTime.parse(json["whenSended"]),
        whenDelivered: DateTime.parse(json["whenDelivered"]),
        comment: json["comment"],
        problem: ProblemModel.fromJson(json["problem"]),
        orderOperator: OperatorModel.fromJson(json["operator"]),
        marketingSource:
            ExternalCourierServiceModel.fromJson(json["marketingSource"]),
        deliveryDuration: json["deliveryDuration"],
        indexInCourierRoute: json["indexInCourierRoute"],
        cookingStartTime: DateTime.parse(json["cookingStartTime"]),
        isDeleted: json["isDeleted"],
        whenReceivedByApi: DateTime.parse(json["whenReceivedByApi"]),
        whenReceivedFromFront: DateTime.parse(json["whenReceivedFromFront"]),
        movedFromDeliveryId: json["movedFromDeliveryId"],
        movedFromTerminalGroupId: json["movedFromTerminalGroupId"],
        movedFromOrganizationId: json["movedFromOrganizationId"],
        externalCourierService: ExternalCourierServiceModel.fromJson(
            json["externalCourierService"]),
        movedToDeliveryId: json["movedToDeliveryId"],
        movedToTerminalGroupId: json["movedToTerminalGroupId"],
        movedToOrganizationId: json["movedToOrganizationId"],
        sum: json["sum"],
        number: json["number"],
        sourceKey: json["sourceKey"],
        whenBillPrinted: DateTime.parse(json["whenBillPrinted"]),
        whenClosed: DateTime.parse(json["whenClosed"]),
        conception: ConceptionModel.fromJson(json["conception"]),
        guestsInfo: GuestsInfoModel.fromJson(json["guestsInfo"]),
        items: List<ItemModel>.from(
            json["items"].map((x) => ItemModel.fromJson(x))),
        combos: List<ComboModel>.from(
            json["combos"].map((x) => ComboModel.fromJson(x))),
        payments: List<PaymentModel>.from(
            json["payments"].map((x) => PaymentModel.fromJson(x))),
        tips: List<PaymentModel>.from(
            json["tips"].map((x) => PaymentModel.fromJson(x))),
        discounts: List<DiscountModel>.from(
            json["discounts"].map((x) => DiscountModel.fromJson(x))),
        orderType: OrderTypeModel.fromJson(json["orderType"]),
        terminalGroupId: json["terminalGroupId"],
        processedPaymentsSum: json["processedPaymentsSum"],
      );

  Map<String, dynamic> toJson() => {
        "parentDeliveryId": parentDeliveryId,
        "customer": customer,
        "phone": phone,
        "deliveryPoint": deliveryPoint,
        "status": status,
        "cancelInfo": cancelInfo,
        "courierInfo": courierInfo,
        "completeBefore": completeBefore.toIso8601String(),
        "whenCreated": whenCreated.toIso8601String(),
        "whenConfirmed": whenConfirmed.toIso8601String(),
        "whenPrinted": whenPrinted.toIso8601String(),
        "whenCookingCompleted": whenCookingCompleted.toIso8601String(),
        "whenSended": whenSended.toIso8601String(),
        "whenDelivered": whenDelivered.toIso8601String(),
        "comment": comment,
        "problem": problem,
        "operator": orderOperator,
        "marketingSource": marketingSource,
        "deliveryDuration": deliveryDuration,
        "indexInCourierRoute": indexInCourierRoute,
        "cookingStartTime": cookingStartTime.toIso8601String(),
        "isDeleted": isDeleted,
        "whenReceivedByApi": whenReceivedByApi.toIso8601String(),
        "whenReceivedFromFront": whenReceivedFromFront.toIso8601String(),
        "movedFromDeliveryId": movedFromDeliveryId,
        "movedFromTerminalGroupId": movedFromTerminalGroupId,
        "movedFromOrganizationId": movedFromOrganizationId,
        "externalCourierService": externalCourierService,
        "movedToDeliveryId": movedToDeliveryId,
        "movedToTerminalGroupId": movedToTerminalGroupId,
        "movedToOrganizationId": movedToOrganizationId,
        "sum": sum,
        "number": number,
        "sourceKey": sourceKey,
        "whenBillPrinted": whenBillPrinted.toIso8601String(),
        "whenClosed": whenClosed.toIso8601String(),
        "conception": conception,
        "guestsInfo": guestsInfo,
        "items": items,
        "combos": combos,
        "payments": payments,
        "tips": tips,
        "discounts": discounts,
        "orderType": orderType,
        "terminalGroupId": terminalGroupId,
        "processedPaymentsSum": processedPaymentsSum,
      };
}
