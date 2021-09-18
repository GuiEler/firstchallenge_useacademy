import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AppGradients {
  static const linear = LinearGradient(colors: [
    Color(0xFF148BBF),
    Color(0xFF105873),
  ], stops: [
    0.25,
    0.85,
  ], transform: GradientRotation(2.13959913 * pi));
}
