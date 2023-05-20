
import 'package:cofee/features/domain/entiti/default_history_entiti.dart/guest_info_entiti.dart';
import 'package:cofee/features/domain/entiti/default_history_entiti.dart/item_entiti.dart';
import 'package:cofee/features/domain/entiti/default_history_entiti.dart/loyalty_info_entiti.dart';
import 'package:cofee/features/domain/entiti/default_history_entiti.dart/order_entiti.dart';
import 'package:cofee/features/domain/entiti/default_history_entiti.dart/payment_entiti.dart';
import 'package:cofee/features/domain/entiti/default_history_entiti.dart/waiter_entiti.dart';

import 'guest_info_model.dart';
import 'item_model.dart';
import 'loyalty_info_model.dart';
import 'payment_model.dart';
import 'waiter_model.dart';

class OrderModel extends OrderEntiti {
  OrderModel({
    required final List<String> tableIds,
    required final dynamic customer,
    required final dynamic phone,
    required final String status,
    required final DateTime whenCreated,
    required final WaiterEntiti waiter,
    required final dynamic tabName,
    required final String splitOrderBetweenCashRegisters,
    required final int sum,
    required final int number,
    required final dynamic sourceKey,
    required final dynamic whenBillPrinted,
    required final dynamic whenClosed,
    required final dynamic conception,
    required final GuestInfoEntiti guestsInfo,
    required final List<ItemEntiti> items,
    required final dynamic combos,
    required final List<PaymentEntiti> payments,
    required final dynamic tips,
    required final dynamic discounts,
    required final dynamic orderType,
    required final String terminalGroupId,
    required final int processedPaymentsSum,
    required final LoyaltyInfoEntiti loyaltyInfo,
  }) : super(
          tableIds: tableIds,
          customer: customer,
          phone: phone,
          status: status,
          whenCreated: whenCreated,
          waiter: waiter,
          tabName: tabName,
          splitOrderBetweenCashRegisters: splitOrderBetweenCashRegisters,
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
          loyaltyInfo: loyaltyInfo,
        );
        factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        tableIds: List<String>.from(json["tableIds"].map((x) => x)),
        customer: json["customer"],
        phone: json["phone"],
        status: json["status"],
        whenCreated: DateTime.parse(json["whenCreated"]),
        waiter: WaiterModel.fromJson(json["waiter"]),
        tabName: json["tabName"],
        splitOrderBetweenCashRegisters: json["splitOrderBetweenCashRegisters"],
        sum: json["sum"],
        number: json["number"],
        sourceKey: json["sourceKey"],
        whenBillPrinted: json["whenBillPrinted"],
        whenClosed: json["whenClosed"],
        conception: json["conception"],
        guestsInfo: GuestInfoModel.fromJson(json["guestsInfo"]),
        items: List<ItemModel>.from(json["items"].map((x) => ItemModel.fromJson(x))),
        combos: json["combos"],
        payments: List<PaymentModel>.from(json["payments"].map((x) => PaymentModel.fromJson(x))),
        tips: json["tips"],
        discounts: json["discounts"],
        orderType: json["orderType"],
        terminalGroupId: json["terminalGroupId"],
        processedPaymentsSum: json["processedPaymentsSum"],
        loyaltyInfo: LoyaltyInfoModel.fromJson(json["loyaltyInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "tableIds": List<dynamic>.from(tableIds.map((x) => x)),
        "customer": customer,
        "phone": phone,
        "status": status,
        "whenCreated": whenCreated.toIso8601String(),
        "waiter": waiter,
        "tabName": tabName,
        "splitOrderBetweenCashRegisters": splitOrderBetweenCashRegisters,
        "sum": sum,
        "number": number,
        "sourceKey": sourceKey,
        "whenBillPrinted": whenBillPrinted,
        "whenClosed": whenClosed,
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
        "loyaltyInfo": loyaltyInfo,
    };
}
