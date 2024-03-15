import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/constants/constants.dart';

import '../providers/add_student_registration_details_p.dart';

class ClassField extends ConsumerWidget {
  const ClassField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final standard = ref.watch(addStudentRegistrationDetailsProvider.select((value) => value.basicDetails.standard));
    return DropdownButtonFormField(
      value: standard,
        decoration: const InputDecoration(
          isDense: true,
          labelText: "Class *",
        ),
        items: List.generate(Constants.className.length, (index) {
          return DropdownMenuItem(
            value: Constants.className[index],
            child: Text(Constants.className[index]),
          );
        }),
        onChanged: (changedVal) {
          ref.read(addStudentRegistrationDetailsProvider.notifier).addStandard(changedVal.toString());
        });
  }
}
