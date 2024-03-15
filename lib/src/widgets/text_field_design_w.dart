import 'package:flutter/material.dart';
import 'package:vsquareclasses/src/extensions/context_extension.dart';

class TextFieldDesign extends StatelessWidget {
  final Widget child;
  final double width;
  const TextFieldDesign({super.key, required this.width, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: context.width * .03,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: context.colorScheme.background,
          boxShadow: [
            BoxShadow(
                color: context.colorScheme.primary.withOpacity(0.2),
                offset: const Offset(2, -2),
                blurRadius: 2)
          ]),
      child: child,
    );
  }
}
