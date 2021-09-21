import 'package:flutter/material.dart';

import 'package:first_challenge/core/core.dart';

class MyAppBar extends PreferredSize {
  MyAppBar({Key? key})
      : super(
            key: key,
            preferredSize: const Size.fromHeight(65),
            child: AppBar(
              title: Text(
                'Perguntas e Respostas',
                style: AppTextStyles.titleBold,
              ),
              centerTitle: true,
              backgroundColor: AppColors.lightBlue,
            ));
}
