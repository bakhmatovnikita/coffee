import 'package:cofee/features/auth/presentation/domain/entiti/token_entiti.dart';

class TokenModel extends TokenEntiti {
  TokenModel({
    required final String token,
  }) : super(
          token: token,
        );
  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        token: json['token'] as String,
      );
  Map<String, dynamic> toJson() {
    return {
      "token": token,
    };
  }
}
