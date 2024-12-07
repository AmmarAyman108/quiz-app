
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/question.dart';

class ResultsView extends StatelessWidget {
  final List<Question> questions;
  final List<int?> answers;

  const ResultsView({super.key, required this.questions, required this.answers});

  @override
  Widget build(BuildContext context) {
    int score = 0;

    for (int i = 0; i < questions.length; i++) {
      if (answers[i] == questions[i].correctAnswer) {
        score++;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score: $score/${questions.length}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Text(
              'You answered correctly $score out of ${questions.length} questions.',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
