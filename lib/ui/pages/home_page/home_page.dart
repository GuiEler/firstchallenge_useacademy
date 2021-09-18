import 'package:first_challenge/core/app_colors.dart';
import 'package:first_challenge/core/app_text_styles.dart';
import 'package:first_challenge/core/core.dart';
import 'package:first_challenge/ui/pages/form_page/form_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      title: Text(
        'Perguntas e Respostas',
        style: AppTextStyles.titleBold,
      ),
      centerTitle: true,
      backgroundColor: AppColors.lightBlue,
    );

    final avaliableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    final avaliableWidth = mediaQuery.size.width;

    void goToFormPage(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const FormPage(),
            settings: RouteSettings(name: '/form', arguments: null)),
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                          onPressed: () => goToFormPage(context),
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
}
