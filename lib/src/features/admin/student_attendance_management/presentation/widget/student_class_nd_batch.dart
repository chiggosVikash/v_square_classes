import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/src/extensions/context_extension.dart';

class StudentClassNdBatch extends StatelessWidget {
  const StudentClassNdBatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.width,
        margin: EdgeInsets.symmetric(
            vertical: context.height * .02, horizontal: context.width * .02),
        padding: EdgeInsets.symmetric(
            vertical: context.height * .01, horizontal: context.width * .02),
        height: context.height * .13,
        decoration: BoxDecoration(
            color: context.colorScheme.background,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, -7),
                  color: context.colorScheme.secondaryContainer)
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Class/Batch to filter Students:",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: context.height * .02,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color:
                      context.colorScheme.secondaryContainer.withOpacity(.3)),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colorScheme.inversePrimary,
                        borderRadius: BorderRadius.circular(30)),
                    height: context.height * .05,
                    width: context.width * .45,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.class_outlined,
                            size: constraints.maxHeight * .35,
                          ),
                          SizedBox(
                            width: constraints.maxWidth * .03,
                          ),
                          Text(
                            "Class",
                            style: GoogleFonts.alegreyaSansSc(
                                fontSize: ((constraints.maxHeight +
                                            constraints.maxHeight) *
                                        context.aspectRatio) *
                                    .4),
                          )
                        ],
                      );
                    }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30)),
                    height: context.height * .05,
                    width: context.width * .45,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.switch_access_shortcut_outlined,
                            size: constraints.maxHeight * .35,
                          ),
                          Text(
                            "Batch",
                            style: GoogleFonts.alegreyaSansSc(
                                fontSize: ((constraints.maxHeight +
                                            constraints.maxHeight) *
                                        context.aspectRatio) *
                                    .4),
                          )
                        ],
                      );
                    }),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
