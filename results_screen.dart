import 'package:flutter/material.dart';
import 'package:flutter_test2/data/questions.dart';
import 'package:flutter_test2/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) => 
      data['user_answer'] == data['correct_answer']
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions correctly!',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 25),
            QuestionsSummary(
              summaryData,
            ),
            const SizedBox(height: 25),
            TextButton.icon(
              onPressed: onRestart,
              label: const Text('Restart Quiz'),
              icon: const Icon(Icons.restart_alt),
            )
          ],
        ),
      ),
    );
  }
}
