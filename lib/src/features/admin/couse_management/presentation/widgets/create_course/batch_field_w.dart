import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/constants/constants.dart';
import 'package:vsquareclasses/src/widgets/text_field_design_w.dart';

import '../../providers/add_course_management_data_p.dart';

class BatchFieldW extends ConsumerWidget {
  final BoxConstraints constraints;
  const BatchFieldW({super.key, required this.constraints});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedBatch = ref
        .watch(addCourseManagementDataProvider.select((value) => value.batch));
    return TextFieldDesign(
      width: constraints.maxWidth,
      child: DropdownButtonFormField(
        value: selectedBatch,
        onChanged: (value) {
          ref
              .read(addCourseManagementDataProvider.notifier)
              .updateBatch(value!);
        },
        items: List.generate(Constants.batchName.length, (index) {
          return DropdownMenuItem(
            child: Text(Constants.batchName[index]),
            value: Constants.batchName[index],
          );
        }),
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: 'Batch Name',
          hintText: 'Enter Batch Name',
        ),
      ),
    );
  }
}
