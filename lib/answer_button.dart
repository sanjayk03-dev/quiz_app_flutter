import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.label,
    required this.buttonHandler,
  });

  final String label;
  final void Function() buttonHandler;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonHandler,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        backgroundColor: const Color.fromARGB(255, 31, 5, 95),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
      ),
    );
  }
}
