import 'dart:convert';

import 'package:first_challenge/shared/models/question_model.dart';

class QuizModel {
  final List<QuestionModel> questions;

  QuizModel({
    required this.questions,
  });

  Map<String, dynamic> toMap() {
    return {
      'questions': questions.map((x) => x.toMap()).toList(),
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
