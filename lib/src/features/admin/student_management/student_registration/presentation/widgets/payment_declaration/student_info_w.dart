import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/extensions/context_extension.dart';

class StudentInfoW extends ConsumerWidget {
  final String _studentName;
  final String _registrationNo;
  final String _formNo;
  final String _course;

  final double _verSpace = .009;
  const StudentInfoW(
      {super.key,
      required String studentName,
      required String registrationNo,
      required String formNo,
      required String course})
      : _course = course,
        _formNo = formNo,
        _registrationNo = registrationNo,
        _studentName = studentName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Student Name: $_studentName"),
                SizedBox(
                  height: context.height * _verSpace,
                ),
                Text("Registration No: $_registrationNo"),
                SizedBox(
                  height: context.height * _verSpace,
                ),
                Text("Form No: $_formNo"),
                SizedBox(
                  height: context.height * _verSpace,
                ),
                Text("Course - $_course"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
