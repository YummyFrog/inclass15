class Question {
  final String questionText;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  Question({
    required this.questionText,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  // Convert JSON from API => Question object
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionText: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswers: List<String>.from(json['incorrect_answers']),
    );
  }

  // Shuffle all answers (correct + incorrect)
  List<String> getShuffledAnswers() {
    final allAnswers = [...incorrectAnswers, correctAnswer];
    allAnswers.shuffle(); // Randomize order
    return allAnswers;
  }
}