import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/question_card.dart';
import '../utils/responsive.dart';
import 'result_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final question = quizProvider.currentQuestion;
    final responsive = Responsive(MediaQuery.of(context).size);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Soal ${quizProvider.currentIndex + 1} dari ${quizProvider.totalQuestions}',
          style: TextStyle(fontSize: responsive.sp(18)),
        ),
        automaticallyImplyLeading: false, // hilangkan tombol back default
      ),

      body: SafeArea(
        child: SingleChildScrollView( // biar aman di landscape & layar kecil
          padding: EdgeInsets.all(responsive.wp(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Kartu pertanyaan responsif
              QuestionCard(question: question),

              SizedBox(height: responsive.hp(3)),

              // Tombol navigasi di bawah
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Tombol kembali (nonaktif di soal pertama)
                  ElevatedButton.icon(
                    onPressed: quizProvider.currentIndex > 0
                        ? quizProvider.previousQuestion
                        : null,
                    icon: const Icon(Icons.arrow_back),
                    label: Text(
                      'Kembali',
                      style: TextStyle(fontSize: responsive.sp(15)),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: responsive.wp(5),
                        vertical: responsive.hp(1.2),
                      ),
                    ),
                  ),

                  // Tombol berikutnya (aktif jika sudah menjawab)
                  ElevatedButton.icon(
                    onPressed: quizProvider.canProceed
                        ? (quizProvider.isLastQuestion
                        ? () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const ResultScreen(),
                        ),
                      );
                    }
                        : quizProvider.nextQuestion)
                        : null,
                    icon: const Icon(Icons.arrow_forward),
                    label: Text(
                      quizProvider.isLastQuestion ? 'Selesai' : 'Berikutnya',
                      style: TextStyle(fontSize: responsive.sp(15)),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: responsive.wp(5),
                        vertical: responsive.hp(1.2),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
