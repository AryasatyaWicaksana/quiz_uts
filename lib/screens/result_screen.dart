import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Hasil Kuis')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Selamat, ${quizProvider.userName}!',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                'Skor Kamu: ${quizProvider.score}/${quizProvider.totalQuestions}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  quizProvider.resetQuiz();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: const Text('Main Lagi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
