import 'package:first_challenge/shared/models/quiz_model.dart';
import 'package:flutter/foundation.dart';

import 'home_repository.dart';
import 'home_state.dart';

class HomeController {
  ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.empty);
  set _state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  QuizModel? quiz;

  final repository = HomeRepository();

  void getQuiz() async {
    _state = HomeState.loading;
    quiz = await repository.getQuiz();
    _state = HomeState.sucess;
  }
}
