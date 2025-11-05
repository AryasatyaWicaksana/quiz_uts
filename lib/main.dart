import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/quiz_provider.dart';
import 'app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => QuizProvider(),
      child: const MyApp(),
    ),
  );
}
