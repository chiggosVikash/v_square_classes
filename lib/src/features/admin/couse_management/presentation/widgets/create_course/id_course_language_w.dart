import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/constants/constants.dart';
import 'package:vsquareclasses/src/features/admin/couse_management/presentation/providers/add_course_management_data_p.dart';
import 'package:vsquareclasses/src/widgets/text_field_design_w.dart';

class IdCourseLanguageW extends ConsumerWidget {
  final BoxConstraints constraints;
  final TextEditingController courseIdController;
  const IdCourseLanguageW(
      {Key? key, required this.constraints, required this.courseIdController})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Course ID Text Field
        Consumer(
          builder: (context, ref, child) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              courseIdController.text = ref.watch(
                  addCourseManagementDataProvider.select((value) => value.id));
              print("Course ID: ${courseIdController.text}");
            });

            return TextFieldDesign(
              width: constraints.maxWidth * 0.45,
              child: TextFormField(
                controller: courseIdController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Course ID',
                  hintText: 'Enter Course ID',
                ),
              ),
            );
          },
        ),

        /// Language Dropdown
        TextFieldDesign(
          width: constraints.maxWidth * 0.45,
          child: Consumer(
            builder: (context, ref, child) {
              final language = ref.watch(addCourseManagementDataProvider
                  .select((value) => value.language));
              return DropdownButtonFormField(
                value: language,
                onChanged: (value) {
                  ref
                      .read(addCourseManagementDataProvider.notifier)
                      .updateLanguage(value.toString());
                },
                items: List.generate(Constants.courseLanguage.length, (index) {
                  return DropdownMenuItem(
                    child: Text(Constants.courseLanguage[index]),
                    value: Constants.courseLanguage[index],
                  );
                }),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Language',
                  hintText: 'Enter Language',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
