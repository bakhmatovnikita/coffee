

import 'package:cofee/features/domain/entiti/default_history_entiti.dart/guest_info_entiti.dart';
import 'package:cofee/features/domain/entiti/default_history_entiti.dart/item_entiti.dart';
import 'package:cofee/features/domain/entiti/default_history_entiti.dart/loyalty_info_entiti.dart';
import 'package:cofee/features/domain/entiti/default_history_entiti.dart/payment_entiti.dart';
import 'package:cofee/features/domain/entiti/default_history_entiti.dart/waiter_entiti.dart';

class OrderEntiti{
  final List<String> tableIds;
    final dynamic customer;
    final dynamic phone;
    final String status;
    final DateTime whenCreated;
    final WaiterEntiti waiter;
    final dynamic tabName;
    final String splitOrderBetweenCashRegisters;
    final int sum;
    final int number;
    final dynamic sourceKey;
    final dynamic whenBillPrinted;
    final dynamic whenClosed;
    final dynamic conception;
    final GuestInfoEntiti guestsInfo;
    final List<ItemEntiti> items;
    final dynamic combos;
    final List<PaymentEntiti> payments;
    final dynamic tips;
    final dynamic discounts;
    final dynamic orderType;
    final String terminalGroupId;
    final int processedPaymentsSum;
    final LoyaltyInfoEntiti loyaltyInfo;

    OrderEntiti({
        required this.tableIds,
        required this.customer,
        required this.phone,
        required this.status,
        required this.whenCreated,
        required this.waiter,
        required this.tabName,
        required this.splitOrderBetweenCashRegisters,
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
        required this.processedPaymentsSum,
        required this.loyaltyInfo,
    });
}