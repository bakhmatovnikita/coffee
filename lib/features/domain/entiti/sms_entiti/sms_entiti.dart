class SmsEntiti {
  final String status;
    final int statusCode;
    final Map<String, Sms> sms;
    final double balance;

    SmsEntiti({
        required this.status,
        required this.statusCode,
        required this.sms,
        required this.balance,
    });
}

class Sms {
  final String status;
  final int statusCode;
  final String smsId;
  final String statusText;

  Sms({
    required this.status,
    required this.statusCode,
    required this.smsId,
    required this.statusText,
  });
}
