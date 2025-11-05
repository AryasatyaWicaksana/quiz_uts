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
        title: Text(
          'Soal ${quizProvider.currentIndex + 1} dari ${quizProvider.totalQuestions}',
        ),
        automaticallyImplyLeading: false, // hilangkan tombol back default
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuestionCard(question: question),
            const SizedBox(height: 20),

            // 🔘 Tombol navigasi di bawah
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Tombol kembali (nonaktif di soal pertama)
                ElevatedButton.icon(
                  onPressed: quizProvider.currentIndex > 0
                      ? quizProvider.previousQuestion
                      : null,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Kembali'),
                ),

                // Tombol berikutnya (hanya aktif jika sudah jawab)
                ElevatedButton.icon(
                  onPressed: quizProvider.canProceed
                      ? (quizProvider.isLastQuestion
                      ? () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResultScreen(),
                      ),
                    );
                  }
                      : quizProvider.nextQuestion)
                      : null, // nonaktif jika belum pilih jawaban
                  icon: const Icon(Icons.arrow_forward),
                  label: Text(
                      quizProvider.isLastQuestion ? 'Selesai' : 'Berikutnya'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
