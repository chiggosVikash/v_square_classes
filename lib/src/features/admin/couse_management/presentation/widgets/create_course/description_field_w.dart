import 'package:flutter/material.dart';
import 'package:vsquareclasses/src/widgets/text_field_design_w.dart';

class DescriptionFieldW extends StatelessWidget {
  final double width;
  final TextEditingController descriptionController;
  const DescriptionFieldW(
      {super.key, required this.width, required this.descriptionController});

  @override
  Widget build(BuildContext context) {
    return TextFieldDesign(
      width: width,
      child: TextFormField(
        controller: descriptionController,
        minLines: 3,
        maxLines: 5,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: 'Description',
          hintText: 'Enter Description',
        ),
      ),
    );
  }
}
