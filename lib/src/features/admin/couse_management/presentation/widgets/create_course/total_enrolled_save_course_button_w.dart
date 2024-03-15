import 'package:flutter/material.dart';
import 'package:vsquareclasses/src/extensions/context_extension.dart';

import '../../../../../../widgets/text_field_design_w.dart';

class TotalEnrolledSaveCourseButtonW extends StatelessWidget {
  final double width;
  final TextEditingController totalEnrolledController;
  final VoidCallback _onPressed;
  const TotalEnrolledSaveCourseButtonW(
      {super.key,
      required this.width,
      required this.totalEnrolledController,
      required VoidCallback onPressed})
      : _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Course ID Text Field
        TextFieldDesign(
          width: width * 0.45,
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: totalEnrolledController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: 'Total Enrolled',
              hintText: 'Enter Total Enrolled',
            ),
          ),
        ),

        FilledButton.tonal(
            style: FilledButton.styleFrom(
              minimumSize: Size(context.width * .44, context.height * .07),
            ),
            onPressed: _onPressed,
            child: Text('Save Course')),
      ],
    );
  }
}
