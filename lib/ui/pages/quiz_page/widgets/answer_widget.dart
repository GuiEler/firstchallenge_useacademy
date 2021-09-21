import 'package:flutter/material.dart';

import 'package:first_challenge/core/core.dart';
import 'package:first_challenge/shared/models/answer_model.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final bool isAnswered;
  final bool disabled;
  final ValueChanged<bool> onTap;

  const AnswerWidget({
    Key? key,
    required this.answer,
    this.isSelected = false,
    this.isAnswered = false,
    this.disabled = false,
    required this.onTap,
  }) : super(key: key);

  bool get isRight => answer.isRight;
  String get title => answer.answer;

  Color get _selectedColorRight => isAnswered
      ? (isRight ? AppColors.darkGreen : AppColors.darkRed)
      : AppColors.blue;

  Color get _selectedBorderRight => isAnswered
      ? (isRight ? AppColors.lightGreen : AppColors.lightRed)
      : AppColors.lightBlue;

  Color get _selectedColorCardRight => isAnswered
      ? (isRight ? AppColors.lightGreen : AppColors.lightRed)
      : AppColors.overlayLightBlue;

  Color get _selectedBorderCardRight => isAnswered
      ? (isRight ? AppColors.green : AppColors.red)
      : AppColors.overlayBlue;

  TextStyle get _selectedTextStyleRight => isAnswered
      ? (isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed)
      : AppTextStyles.bodyDarkBlue;

  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled,
      child: GestureDetector(
        onTap: () {
          onTap(answer.isRight);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Container(
            height: 72,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: isSelected ? _selectedColorCardRight : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(BorderSide(
                    color: isSelected
                        ? _selectedBorderCardRight
                        : AppColors.lightBlue))),
            child: Row(children: [
              Expanded(
                child: Text(
                  title,
                  style: isSelected
                      ? _selectedTextStyleRight
                      : AppTextStyles.body15,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    color: isSelected ? _selectedColorRight : AppColors.white,
                    borderRadius: BorderRadius.circular(500),
                    border: Border.fromBorderSide(BorderSide(
                        color: isSelected
                            ? _selectedBorderRight
                            : AppColors.border))),
                child: isSelected
                    ? (isAnswered
                        ? Icon(
                            _selectedIconRight,
                            size: 16,
                            color: AppColors.white,
                          )
                        : null)
                    : null,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
