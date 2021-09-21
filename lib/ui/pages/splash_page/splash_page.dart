import 'package:first_challenge/core/core.dart';
import 'package:first_challenge/shared/route_animations/route_animations.dart';
import 'package:first_challenge/ui/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000)).then((_) =>
        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            RouteAnimations(
                    route: const HomePage(), duration: 1000, routeName: '/home')
                .opacityTransition(0.3),
            (Route<dynamic> route) => false));
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppGradients.linear,
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(AppImages.logo)),
      ),
    );
  }
}
