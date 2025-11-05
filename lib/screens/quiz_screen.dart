import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/question_card.dart';
import 'result_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);

    final question = quizProvider.currentQuestion;

    return Scaffold(
      appBar: AppBar(
        title: Text('Soal ${quizProvider.currentIndex + 1} dari ${quizProvider.totalQuestions}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            QuestionCard(question: question),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: quizProvider.isLastQuestion
                  ? () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ResultScreen()),
                );
              }
                  : quizProvider.nextQuestion,
              child: Text(quizProvider.isLastQuestion ? 'Selesai' : 'Soal Berikutnya'),
            ),
          ],
        ),
      ),
    );
  }
}
