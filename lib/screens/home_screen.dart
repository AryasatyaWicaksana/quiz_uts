import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../utils/responsive.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);
    final responsive = Responsive(MediaQuery.of(context).size);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView( // biar aman di landscape & device kecil
          child: Padding(
            padding: EdgeInsets.all(responsive.wp(6)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo responsif
                Image.asset(
                  'assets/images/Logo.png',
                  height: responsive.hp(25),
                  fit: BoxFit.contain,
                ),
                SizedBox(height: responsive.hp(2)),

                Text(
                  'Selamat Datang di Quiz UTS!',
                  style: TextStyle(
                    fontSize: responsive.sp(22),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: responsive.hp(3)),

                TextField(
                  controller: nameController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    labelText: 'Masukkan Nama Kamu',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: responsive.hp(3)),

                ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty) {
                      quizProvider.setUserName(nameController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const QuizScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Silakan masukkan nama terlebih dahulu.'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: responsive.wp(10),
                      vertical: responsive.hp(2),
                    ),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Mulai Kuis',
                    style: TextStyle(
                      fontSize: responsive.sp(18),
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
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
