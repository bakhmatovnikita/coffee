import 'package:cofee/features/domain/entiti/sms_entiti/sms_entiti.dart';

class SmsModel extends SmsEntiti {
  SmsModel({
    required super.status,
    required super.statusCode,
    required super.sms,
    required super.balance,
  });
  factory SmsModel.fromJson(Map<String, dynamic> json) => SmsModel(
        status: json["status"],
        statusCode: json["status_code"],
        sms: Map.from(json["sms"])
            .map((k, v) => MapEntry<String, SmsS>(k, SmsS.fromJson(v))),
        balance: json["balance"]?.toDouble(),
      );
}

class SmsS extends Sms {
  SmsS({
    required super.status,
    required super.statusCode,
    required super.smsId,
    required super.statusText,
  });
  factory SmsS.fromJson(Map<String, dynamic> json) => SmsS(
        status: json["status"],
        statusCode: json["status_code"],
        smsId: json["sms_id"],
        statusText: json["status_text"],
      );
}
