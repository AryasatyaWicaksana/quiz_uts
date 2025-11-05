class Question {
  final String text;          // isi pertanyaan
  final List<String> options; // daftar pilihan
  final int correctIndex;     // index dari jawaban yang benar

  Question({
    required this.text,
    required this.options,
    required this.correctIndex,
  });
}
