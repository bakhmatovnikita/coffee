import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sberbank_acquiring/sberbank_acquiring_core.dart';
import 'package:sberbank_acquiring/sberbank_acquiring_ui.dart';

class PaymentBottomsheet extends StatefulWidget {
  final SberbankAcquiring acquiring;
  final String formUrl;
  OrderStatus? orderStatus;
  final Function() successPaid;
  PaymentBottomsheet(
      {super.key,
      required this.acquiring,
      required this.formUrl,
      required this.orderStatus,
      required this.successPaid});

  @override
  State<PaymentBottomsheet> createState() => _PaymentBottomsheetState();
}

class _PaymentBottomsheetState extends State<PaymentBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return  WebViewPayment(
        logger: widget.acquiring.logger,
        formUrl: widget.formUrl,
        returnUrl: 'https://3dsec.sberbank.ru/payment/rest/register.do',
        failUrl: 'https://www.yandex.ru/',
        onLoad: (bool v) {
          debugPrint('WebView load: $v');
        },
        onError: () {
          debugPrint('WebView Error');
        },
        onFinished: (String? v) async {
          print('finished!!!!');
          final GetOrderStatusExtendedResponse status =
              await widget.acquiring.getOrderStatusExtended(
            GetOrderStatusExtendedRequest(orderId: v),
          );
          widget.successPaid();

          widget.orderStatus = status.orderStatus;
          setState(() {});

          Navigator.of(context).pop();
        },
      );
  }
}
