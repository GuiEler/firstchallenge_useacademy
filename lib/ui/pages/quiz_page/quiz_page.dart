import 'package:first_challenge/core/app_colors.dart';
import 'package:first_challenge/core/app_text_styles.dart';
import 'package:first_challenge/shared/models/answer_model.dart';
import 'package:first_challenge/shared/route_animations/route_animations.dart';
import 'package:first_challenge/ui/pages/quiz_page/widgets/answer_widget.dart';
import 'package:first_challenge/ui/pages/result_page.dart/result_page.dart';
import 'package:flutter/material.dart';
import 'package:first_challenge/shared/models/quiz_model.dart';
import 'package:first_challenge/shared/widgets/myappbar.dart';

class QuizPage extends StatefulWidget {
  final QuizModel quiz;
  final int index;
  final int score;

  const QuizPage({
    Key? key,
    required this.quiz,
    this.index = 0,
    this.score = 0,
  }) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int selectedAnswer = -1;
  int currentScore = 0;
  bool isAnswered = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBar = MyAppBar();
    final avaliableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;
    final avaliableWidth = mediaQuery.size.width;
    final index = widget.index;
    final question = widget.quiz.questions[index];
    final List<AnswerModel> answers = question.answers;
    final score = widget.score;

    void goToNextQuestion() {
      if (index < widget.quiz.questions.length - 1) {
        Navigator.of(context).push(RouteAnimations(
                route: QuizPage(
                    quiz: widget.quiz,
                    index: index + 1,
                    score: score + currentScore),
                duration: 1000,
                routeName: '/q$widget.index')
            .slide());
      } else {
        Navigator.of(context).push(RouteAnimations(
                route: ResultPage(
                  score: score + currentScore,
                  length: widget.quiz.questions.length,
                ),
                duration: 1000,
                routeName: '/result')
            .slide());
      }
    }

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: avaliableWidth * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: avaliableHeight * 0.24,
                child: Text(
                  question.question,
                  style: TextStyle(
                    fontFamily: AppTextStyles.title.fontFamily,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkBlue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                  height: avaliableHeight * 0.58,
                  child: ListView.separated(
                      itemCount: 4,
                      itemBuilder: (context, index) => AnswerWidget(
                          answer: answers[index],
                          isSelected: index == selectedAnswer,
                          disabled: isAnswered,
                          isAnswered: isAnswered,
                          onTap: (value) => {
                                setState(() {
                                  selectedAnswer = index;
                                  if (value) {
                                    currentScore++;
                                  }
                                }),
                                Future.delayed(const Duration(seconds: 1))
                              }),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16.0))),
              isAnswered
                  ? ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          width: double.maxFinite,
                          height: avaliableHeight * 0.08),
                      child: ElevatedButton(
                        onPressed: () => goToNextQuestion(),
                        child: Text(
                          'Próxima pergunta',
                          style: AppTextStyles.titleBold,
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60)),
                        ),
                      ),
                    )
                  : ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          width: double.maxFinite,
                          height: avaliableHeight * 0.08),
                      child: ElevatedButton(
                        onPressed: () => selectedAnswer != -1
                            ? setState(() {
                                isAnswered = true;
                              })
                            : {},
                        child: Text(
                          'Responder',
                          style: AppTextStyles.titleBold,
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60)),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
