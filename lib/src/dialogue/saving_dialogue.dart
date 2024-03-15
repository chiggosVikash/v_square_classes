import 'package:flutter/material.dart';

class SavingDialogue extends StatelessWidget {
  final String _title;
  const SavingDialogue({super.key, required String title}) : _title = title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_title),
      content: const RepaintBoundary(child: LinearProgressIndicator()),
    );
  }
}
