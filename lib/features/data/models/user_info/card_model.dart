import 'package:cofee/features/domain/entiti/user_info/card_entiti.dart';

class CardModel extends CardEntiti {
  CardModel({
    required final String id,
    required final String track,
    required final String number,
    required final DateTime validToDate,
  }) : super(
          id: id,
          track: track,
          number: number,
          validToDate: validToDate,
        );
  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        id: json["id"],
        track: json["track"],
        number: json["number"],
        validToDate: DateTime.parse(json["validToDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "track": track,
        "number": number,
        "validToDate": validToDate.toIso8601String(),
      };
}
