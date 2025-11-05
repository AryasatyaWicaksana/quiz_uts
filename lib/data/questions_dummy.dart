import '../models/question.dart';

final List<Question> questionsDummy = [
  Question(
    text: 'Siapa penemu bahasa pemrograman Python?',
    options: [
      'James Gosling',
      'Guido van Rossum',
      'Bjarne Stroustrup',
      'Dennis Ritchie',
    ],
    correctIndex: 1,
  ),
  Question(
    text: 'Apa ekstensi file untuk berkas source code Dart?',
    options: [
      '.dart',
      '.java',
      '.py',
      '.kt',
    ],
    correctIndex: 0,
  ),
  Question(
    text: 'Widget di Flutter yang tidak dapat berubah disebut?',
    options: [
      'StatefulWidget',
      'StatelessWidget',
      'InheritedWidget',
      'ProviderWidget',
    ],
    correctIndex: 1,
  ),
  Question(
    text: 'Perintah untuk menjalankan aplikasi Flutter adalah?',
    options: [
      'flutter build',
      'flutter pub get',
      'flutter run',
      'flutter doctor',
    ],
    correctIndex: 2,
  ),
  Question(
    text: 'Manakah yang termasuk bahasa pemrograman berbasis OOP?',
    options: [
      'HTML',
      'CSS',
      'Python',
      'SQL',
    ],
    correctIndex: 2,
  ),
];
