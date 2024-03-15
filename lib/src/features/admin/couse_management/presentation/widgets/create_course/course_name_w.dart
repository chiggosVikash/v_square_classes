import 'package:flutter/material.dart';
import 'package:vsquareclasses/src/widgets/text_field_design_w.dart';

class CourseNameW extends StatelessWidget {
  final BoxConstraints constraints;
  final TextEditingController courseNameController;
  const CourseNameW(
      {super.key,
      required this.constraints,
      required this.courseNameController});

  @override
  Widget build(BuildContext context) {
    return TextFieldDesign(
      width: constraints.maxWidth,
      child: TextFormField(
        controller: courseNameController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: 'Course Name',
          hintText: 'Enter Course Name',
        ),
      ),
    );
  }
}
