
import 'package:flutter/material.dart';
import '../widget/student_card.dart';
import '/src/extensions/context_extension.dart';

import '../widget/student_class_nd_batch.dart';

class StudentAttendanceS extends StatefulWidget {
  static const routeAddress = 'studentAttendance';
  static const routeName = 'Student Attendance';
  const StudentAttendanceS({super.key});

  @override
  State<StudentAttendanceS> createState() => _StudentAttendanceSState();
}

class _StudentAttendanceSState extends State<StudentAttendanceS> {
  String isMark = "Unmark";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.qr_code_2,
              ))
        ],
      ),
      body: Column(
        children: [
          const StudentClassNdBatch(),
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                      vertical: context.height * .02,
                      horizontal: context.width * .02),
                  itemBuilder: (context, index) {
                    return Dismissible(
                      secondaryBackground: Container(
                        color: Colors.red,
                        child: const Icon(Icons.abc),
                      ),
                      background: Container(
                        color: Colors.green,
                        child: const Icon(Icons.done),
                      ),
                        direction: DismissDirection.horizontal,
                        onUpdate: (details){

                        },
                        dismissThresholds: const {
                          DismissDirection.startToEnd: 0.5,
                          DismissDirection.endToStart: 0.5
                        },
                        // onHorizontalDragUpdate: (details) {
                        //   if (details.delta.dx > 0) {
                        //     setState(() {
                        //       isMark = "A";
                        //     });
                        //   } else if (details.delta.dx < 0) {
                        //     setState(() {
                        //       isMark = "P";
                        //     });
                        //   }
                        // },
                        key: Key(index.toString()),
                        child: StudentCard(isMark: isMark, index: index));
                  }))
        ],
      ),
    );
  }
}
