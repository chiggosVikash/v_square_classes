import 'package:flutter/material.dart';
import '/src/extensions/context_extension.dart';

import 'attendance_text.dart';

class StudentCard extends StatelessWidget {
  final String isMark;
  final int index;
  const StudentCard({super.key, required this.isMark, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: context.height * .01),
      decoration: BoxDecoration(
          color: context.colorScheme.background,
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"),
          ),
          title: Text('Student $index'),
          trailing: isMark == "P"
              ? const AttendanceText(
                  attendanceText: "Mark",
                  color: Colors.teal,
                  icon: Icon(
                    Icons.done_all,
                    color: Colors.teal,
                  ))
              : isMark == "A"
                  ? AttendanceText(
                      attendanceText: "Absent",
                      color: Colors.red,
                      icon: Text(
                        "X",
                        style: TextStyle(color: Colors.red.shade300),
                      ),
                    )
                  : const AttendanceText(
                      attendanceText: "Unmark",
                      color: Colors.amber,
                      icon: Icon(
                        Icons.circle_outlined,
                        color: Colors.amber,
                      ),
                    )),
    );
  }
}
