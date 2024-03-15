import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsquareclasses/src/extensions/context_extension.dart';

class SuccessfulDialogue extends StatelessWidget {
  final String _content;
  final VoidCallback? _onPressed;
  final String buttonText;
  final List<Widget>? actions;
  const SuccessfulDialogue(
      {super.key,
      required String content,
      required VoidCallback? onPressed,
      this.buttonText = "Done",
      this.actions})
      : _content = content,
        _onPressed = onPressed;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Stack(
      children: [
        AlertDialog(
          surfaceTintColor: Theme.of(context).colorScheme.primary,
          title: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal.shade300, width: 4),
                    color: Colors.teal.shade100,
                    shape: BoxShape.circle),
                height: context.height * .07,
                width: context.height * .07,
                child: LayoutBuilder(builder: (context, constraints) {
                  return Icon(
                    Icons.done_all_rounded,
                    color: Theme.of(context).colorScheme.secondary,
                    size: constraints.biggest.height * .7,
                  );
                }),
              ),
              Container(
                  margin: EdgeInsets.only(top: context.height * .03),
                  child: Text(
                    "Successful !",
                    style: GoogleFonts.cantataOne(
                        color: Theme.of(context).colorScheme.surfaceTint,
                        height: .5),
                  )),
            ],
          ),
          content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "$_content .",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.outline),
                ),
                SizedBox(
                  height: context.height * .005,
                ),
              ]),
          actions: [
            FilledButton.tonal(onPressed: _onPressed, child: Text(buttonText)),
            ...?actions
          ],
        ),
      ],
    );
  }
}
