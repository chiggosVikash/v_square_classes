import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/extensions/context_extension.dart';

class SaveDetailsButton extends ConsumerWidget {
  final VoidCallback _onPressed;
  const SaveDetailsButton({super.key,required void Function() onPressed}) : _onPressed = onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.tonal(
        style: FilledButton.styleFrom(
          minimumSize: Size(context.width * .6, context.height * .06),
        ),
        onPressed: _onPressed,
        child: const Text("Save Details"));
  }
}
