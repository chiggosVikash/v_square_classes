import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/extensions/date_format_extension.dart';

import '../providers/add_student_registration_details_p.dart';

class DateOfBirthField extends ConsumerWidget {
  final TextEditingController _dateOfBirthController;
  const DateOfBirthField({super.key,required TextEditingController dateOfBirthController}) : _dateOfBirthController = dateOfBirthController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDateOfBirth = ref.watch(addStudentRegistrationDetailsProvider.select((value) => value.basicDetails.dateOfBirth));
    Future((){
      _dateOfBirthController.text = selectedDateOfBirth.formattedDate;
    });
    return TextFormField(
      readOnly: true,
      controller: _dateOfBirthController,
      decoration:
          const InputDecoration(isDense: true, labelText: "Date of Birth *"),
      onTap: () {
        _selectDate(context, ref);
      },
    );
  }

  Future<void> _selectDate(BuildContext context, WidgetRef ref) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year - 18),
        firstDate: DateTime(1980),
        lastDate: DateTime(DateTime.now().year));

    if (picked != null) {
      ref.read(addStudentRegistrationDetailsProvider.notifier).addDateOfBirth(picked.toIso8601String());
    }
  }
}
