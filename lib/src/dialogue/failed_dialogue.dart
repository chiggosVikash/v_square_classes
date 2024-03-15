import 'package:flutter/material.dart';

class FailedDialogue extends StatelessWidget {
  final String _message;
  final VoidCallback? _cancelButton;
  final VoidCallback? _tryAgainButton;
  const FailedDialogue(
      {super.key,
      required String message,
      required VoidCallback? cancelButton,
      required VoidCallback? tryAgainButton})
      : _message = message,
        _cancelButton = cancelButton,
        _tryAgainButton = tryAgainButton;

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: const Text("Failed !"),
      content: Text(_message),
      actions: [
        if (_cancelButton != null && _tryAgainButton != null)
          FilledButton.tonal(
              onPressed: _cancelButton, child: const Text("Cancel")),
        FilledButton.tonal(
            onPressed: _tryAgainButton, child: const Text("Try Again")),
      ],
    );
  }
}
