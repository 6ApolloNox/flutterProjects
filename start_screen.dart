import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, this.testButton, {super.key});

  final void Function() startQuiz;
  final void Function() testButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'The Quiz will test how capable you are.',
            style: TextStyle(color: Colors.deepOrange),
          ),
          const SizedBox(height: 50),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text('Start Your Quiz Now'),
            icon: const Icon(Icons.question_mark),
          ),
          TextButton.icon(
            onPressed: testButton,
            icon: const Icon(Icons.check),
            label: const Text('Test Button'),
          ),
        ],
      ),
    );
  }
}
