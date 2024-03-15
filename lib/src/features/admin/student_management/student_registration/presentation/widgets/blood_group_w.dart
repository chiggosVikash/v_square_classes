import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../constants/constants.dart';
import '../providers/add_student_registration_details_p.dart';

class BloodGroupField extends ConsumerWidget {
  const BloodGroupField({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedBloodGroup = ref.watch(addStudentRegistrationDetailsProvider.select((value) => value.medicalInformation.bloodGroup));
    return DropdownButtonFormField(
        decoration: const InputDecoration(labelText: "Blood Group"),
        value: selectedBloodGroup,
        items: List.generate(Constants.bloodGroup.length, (index) {
          return DropdownMenuItem(
              value: Constants.bloodGroup[index],
              child: Text(Constants.bloodGroup[index]));
        }),
        onChanged: (value) {
          ref.read(addStudentRegistrationDetailsProvider.notifier).addBloodGroup(value!);
        });
  }
}
