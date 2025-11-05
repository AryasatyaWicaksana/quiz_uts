import 'package:flutter/material.dart';
import '../models/question.dart';
import '../data/questions_dummy.dart';

class QuizProvider extends ChangeNotifier {
  String _userName = '';
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedAnswerIndex;

  final List<Question> _questions = questionsDummy;

  // Getter
  String get userName => _userName;
  int get currentIndex => _currentIndex;
  int get score => _score;
  int? get selectedAnswerIndex => _selectedAnswerIndex;
  int get totalQuestions => _questions.length;
  Question get currentQuestion => _questions[_currentIndex];
  bool get isLastQuestion => _currentIndex == _questions.length - 1;

  // Setter
  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  // Saat user memilih jawaban
  void selectAnswer(int index) {
    _selectedAnswerIndex = index;

    // Jika jawaban benar → tambah skor
    if (index == _questions[_currentIndex].correctIndex) {
      _score++;
    }

    notifyListeners();
  }

  // Pindah ke soal berikutnya
  void nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
      _selectedAnswerIndex = null; // reset pilihan
      notifyListeners();
    }
  }

  // Reset seluruh quiz (saat user main ulang)
  void resetQuiz() {
    _userName = '';
    _currentIndex = 0;
    _score = 0;
    _selectedAnswerIndex = null;
    notifyListeners();
  }
}
