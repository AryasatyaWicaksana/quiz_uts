import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../utils/responsive.dart';
import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);
    final responsive = Responsive(MediaQuery.of(context).size);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hasil Kuis',
          style: TextStyle(fontSize: responsive.sp(18)),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(responsive.wp(6)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: responsive.hp(5)),

                // Nama pengguna
                Text(
                  'Selamat, ${quizProvider.userName}!',
                  style: TextStyle(
                    fontSize: responsive.sp(22),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: responsive.hp(3)),

                //  Skor akhir
                Text(
                  'Skor Kamu: ${quizProvider.score}/${quizProvider.totalQuestions}',
                  style: TextStyle(
                    fontSize: responsive.sp(20),
                    color: Colors.grey[800],
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: responsive.hp(5)),

                // Tombol ulangi kuis
                ElevatedButton(
                  onPressed: () {
                    quizProvider.resetQuiz();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: responsive.wp(10),
                      vertical: responsive.hp(1.8),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Main Lagi',
                    style: TextStyle(fontSize: responsive.sp(16)),
                  ),
                ),

                SizedBox(height: responsive.hp(4)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
