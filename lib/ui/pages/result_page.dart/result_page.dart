import 'package:first_challenge/shared/route_animations/route_animations.dart';
import 'package:first_challenge/ui/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

import 'package:first_challenge/core/core.dart';

class ResultPage extends StatelessWidget {
  final int score;
  final int length;

  const ResultPage({
    Key? key,
    required this.score,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final avaliableHeight = mediaQuery.size.height - mediaQuery.padding.top;
    final percentage = score / length;
    void goHome() {
      Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
          RouteAnimations(
                  route: const HomePage(), duration: 1000, routeName: '/home')
              .opacityTransition(0.3),
          (Route<dynamic> route) => false);
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: (percentage > 0.66)
                    ? [
                        Image.asset(AppImages.trophy),
                        Column(
                          children: [
                            Text(
                              "Parabéns!",
                              style: AppTextStyles.heading40,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Text.rich(
                              TextSpan(
                                  text: "Você concluiu o quiz",
                                  style: AppTextStyles.body,
                                  children: [
                                    TextSpan(
                                        text: "\ncom $score de $length acertos",
                                        style: AppTextStyles.body)
                                  ]),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ]
                    : (percentage > 0.33 && percentage <= 0.66)
                        ? [
                            Image.asset(AppImages.secondPlace),
                            Column(
                              children: [
                                Text(
                                  "Até que você foi bem!",
                                  style: AppTextStyles.heading40,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                Text.rich(
                                  TextSpan(
                                      text: "Você concluiu o quiz",
                                      style: AppTextStyles.body,
                                      children: [
                                        TextSpan(
                                            text:
                                                "\ncom $score de $length acertos",
                                            style: AppTextStyles.body)
                                      ]),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ]
                        : [
                            Image.asset(AppImages.thirdPlace),
                            Column(
                              children: [
                                Text(
                                  "Fica esperto na próxima...",
                                  style: AppTextStyles.heading40,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                Text.rich(
                                  TextSpan(
                                      text: "Você concluiu o quiz",
                                      style: AppTextStyles.body,
                                      children: [
                                        TextSpan(
                                            text:
                                                "\ncom $score de $length acertos",
                                            style: AppTextStyles.body)
                                      ]),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ]),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    width: double.maxFinite, height: avaliableHeight * 0.08),
                child: ElevatedButton(
                  onPressed: () => goHome(),
                  child: Text(
                    'Voltar ao início',
                    style: AppTextStyles.titleBold,
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
