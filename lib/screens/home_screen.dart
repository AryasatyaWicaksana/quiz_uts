import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 👇 Tambahkan logo di sini
              Image.asset(
                'assets/images/Logo.png',
                height: 250,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 5),

              const Text(
                'Selamat Datang di Quiz UTS!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Masukkan Nama Kamu',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty) {
                    quizProvider.setUserName(nameController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QuizScreen()),
                    );
                  }
                },
                child: const Text('Mulai Kuis'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
