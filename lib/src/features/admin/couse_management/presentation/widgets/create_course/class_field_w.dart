import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/constants/constants.dart';
import 'package:vsquareclasses/src/features/admin/couse_management/presentation/providers/add_course_management_data_p.dart';
import 'package:vsquareclasses/src/widgets/text_field_design_w.dart';

class ClassFieldW extends ConsumerWidget {
  final BoxConstraints constraints;
  const ClassFieldW({super.key, required this.constraints});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final class_ = ref
        .watch(addCourseManagementDataProvider.select((value) => value.class_));
    return TextFieldDesign(
      width: constraints.maxWidth,
      child: DropdownButtonFormField(
        value: class_,
        onChanged: (value) {
          ref
              .read(addCourseManagementDataProvider.notifier)
              .updateClassName(value!);
        },
        items: List.generate(Constants.className.length, (index) {
          return DropdownMenuItem(
            value: Constants.className[index],
            child: Text(Constants.className[index]),
          );
        }),
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: 'Class Name',
          hintText: 'Enter Class Name',
        ),
      ),
    );
  }
}
