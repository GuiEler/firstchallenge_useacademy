import 'dart:convert';

class AnswerModel {
  final String answer;
  final bool isRight;

  AnswerModel({
    required this.answer,
    required this.isRight,
  });

  Map<String, dynamic> toMap() {
    return {
      'answer': answer,
      'isRight': isRight,
    };
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
      answer: map['answer'],
      isRight: map['isRight'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerModel.fromJson(String source) =>
      AnswerModel.fromMap(json.decode(source));
}
