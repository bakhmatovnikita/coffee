import 'package:cofee/features/domain/entiti/history/problem_entiti.dart';

class ProblemModel extends ProblemEntiti {
  ProblemModel({
    required final bool hasProblem,
    required final String description,
  }) : super(
          hasProblem: hasProblem,
          description: description,
        );
  factory ProblemModel.fromJson(Map<String, dynamic> json) => ProblemModel(
        hasProblem: json["hasProblem"] ?? false,
        description: json["description"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "hasProblem": hasProblem,
        "description": description,
      };
}
