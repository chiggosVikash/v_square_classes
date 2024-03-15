import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/constants/constants.dart';
import 'package:vsquareclasses/src/features/admin/couse_management/presentation/providers/add_course_management_data_p.dart';
import 'package:vsquareclasses/src/widgets/text_field_design_w.dart';

class CourseDurationAndType extends ConsumerWidget {
  final BoxConstraints constraints;
  final TextEditingController durationController;
  const CourseDurationAndType(
      {Key? key, required this.constraints, required this.durationController})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Course ID Text Field
        TextFieldDesign(
          width: constraints.maxWidth * 0.45,
          child: TextFormField(
            controller: durationController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: 'Duration',
              hintText: 'Enter Duration',
            ),
          ),
        ),

        /// Language Dropdown
        TextFieldDesign(
          width: constraints.maxWidth * 0.45,
          child: Consumer(
            builder: (context, ref, child) {
              final selectedDurationType = ref.watch(
                  addCourseManagementDataProvider
                      .select((value) => value.durationType));
              return DropdownButtonFormField(
                //TODO: change selection type
                value: selectedDurationType,
                onChanged: (value) {
                  ref
                      .read(addCourseManagementDataProvider.notifier)
                      .updateDurationType(value!);
                },
                items:
                    List.generate(Constants.courseDurationType.length, (index) {
                  return DropdownMenuItem(
                    child: Text(Constants.courseDurationType[index]),
                    value: Constants.courseDurationType[index],
                  );
                }),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Duration Type',
                  hintText: 'Enter Duration Type',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
