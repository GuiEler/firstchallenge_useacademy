import 'package:first_challenge/core/app_colors.dart';
import 'package:first_challenge/core/app_text_styles.dart';
import 'package:first_challenge/core/core.dart';
import 'package:first_challenge/shared/models/quiz_model.dart';
import 'package:first_challenge/shared/widgets/myappbar.dart';
import 'package:first_challenge/ui/pages/home_page/home_controller.dart';
import 'package:first_challenge/ui/pages/quiz_page/quiz_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getQuiz();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.sucess) {
      final mediaQuery = MediaQuery.of(context);
      final appBar = MyAppBar();
      QuizModel quiz;

      quiz = controller.quiz!;

      final avaliableHeight = mediaQuery.size.height -
          appBar.preferredSize.height -
          mediaQuery.padding.top;

      final avaliableWidth = mediaQuery.size.width;

      void goToQuizPage(BuildContext context) {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => QuizPage(
                    quiz: quiz,
                  ),
              settings: const RouteSettings(name: '/quiz')),
        );
      }

      return Scaffold(
        appBar: appBar,
        body: SafeArea(
          top: true,
          child: Container(
            color: AppColors.overlayLightBlue,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: avaliableWidth * 0.075),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                                color: AppColors.lightGrey,
                                spreadRadius: 0.1,
                                blurRadius: 3,
                                offset: Offset(0.5, 1.2))
                          ],
                          color: AppColors.white),
                      width: double.maxFinite,
                      height: avaliableHeight * 0.35,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                              'Perguntas e Respostas',
                              style: TextStyle(
                                  color: AppColors.lightBlue,
                                  fontFamily: AppTextStyles.title.fontFamily,
                                  fontWeight: FontWeight.w600,
                                  fontSize: avaliableWidth * 0.06),
                            )),
                            const SizedBox(
                              height: 16,
                            ),
                            Center(
                              child: Text(
                                'Responda 10 perguntas e veja sua pontuação no fim!',
                                style: AppTextStyles.body16,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: avaliableWidth * 0.75,
                                  height: avaliableHeight * 0.08),
                              child: ElevatedButton(
                                onPressed: () => goToQuizPage(context),
                                child: const Text('Start!'),
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
                  ]),
            ),
          ),
        ),
      );
    }
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.lightBlue),
        ),
      ),
    );
  }
}
