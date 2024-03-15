import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/src/extensions/context_extension.dart';

class AttendanceText extends StatelessWidget {
  final String attendanceText;
  final Color color;
  final Widget icon;
  const AttendanceText(
      {super.key,
      required this.attendanceText,
      required this.color,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: context.height * .002, horizontal: context.width * .02),
        decoration: BoxDecoration(
            color: color.withOpacity(.3),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            // Icon(
            //   Icons.done_all,
            //   color: color,
            // ),
            SizedBox(
              width: context.width * .02,
            ),
            Text(
              attendanceText,
              style: GoogleFonts.alegreyaSansSc(
                fontSize: 16,
              ),
            ),
          ],
        ));
  }
}
