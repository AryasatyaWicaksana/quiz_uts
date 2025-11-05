import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String quiz = '/quiz';
  static const String result = '/result';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    quiz: (context) => const QuizScreen(),
    result: (context) => const ResultScreen(),
  };
}
