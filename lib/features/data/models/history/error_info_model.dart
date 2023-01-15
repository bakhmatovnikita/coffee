import 'package:cofee/features/domain/entiti/history/error_info_entiti.dart';

class ErrorInfoModel extends ErrorInfoEntiti {
  ErrorInfoModel({
    required final String code,
    required final String message,
    required final String description,
    required final dynamic additionalData,
  }) : super(
          code: code,
          message: message,
          description: description,
          additionalData: additionalData,
        );
  factory ErrorInfoModel.fromJson(Map<String, dynamic> json) => ErrorInfoModel(
        code: json["code"],
        message: json["message"],
        description: json["description"],
        additionalData: json["additionalData"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "description": description,
        "additionalData": additionalData,
      };
}
