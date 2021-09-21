import 'dart:convert';

import 'package:first_challenge/shared/models/quiz_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<QuizModel> getQuiz() async {
    final response = await rootBundle.loadString("database/quiz.json");
    final string = jsonDecode(response) as Map<String, dynamic>;
    final quiz = QuizModel.fromMap(string);
    return quiz;
  }
}
