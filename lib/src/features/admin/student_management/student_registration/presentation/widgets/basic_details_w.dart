import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/constants/constants.dart';
import 'package:vsquareclasses/src/extensions/context_extension.dart';
import 'package:vsquareclasses/src/extensions/gradient_extension.dart';

import '../providers/add_student_registration_details_p.dart';
import 'class_field_w.dart';
import 'date_of_birth_field_w.dart';
import 'header_text_w.dart';

class BasicDetails extends ConsumerWidget {
  final TextEditingController _nameController;
  final TextEditingController _dateOfBirthController;
  final TextEditingController _fatherNameController;
  final TextEditingController _motherNameController;
  final TextEditingController _previousSchoolController;
  const BasicDetails(
      {super.key,
      required TextEditingController dateOfBirthController,
      required TextEditingController fatherNameController,
      required TextEditingController motherNameController,
      required TextEditingController nameController,
      required TextEditingController previousSchoolController})
      : _previousSchoolController = previousSchoolController,
        _motherNameController = motherNameController,
        _fatherNameController = fatherNameController,
        _dateOfBirthController = dateOfBirthController,
        _nameController = nameController;
  final double _verSpace = .02;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderText(text: "Basic Details"),
        Container(
          decoration: context.customBoxDecoration,
          padding: EdgeInsets.symmetric(
              horizontal: context.width * .03, vertical: context.height * .02),
          margin: EdgeInsets.symmetric(
              horizontal: context.width * .02, vertical: context.height * .02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: SizedBox(
                      width: context.width * .1,
                      child: const Divider(
                        thickness: 3,
                      ))),
              SizedBox(
                height: context.height * .02,
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                    labelText: " Name *", suffixIcon: Icon(Icons.person)),
              ),
              SizedBox(
                height: context.height * _verSpace,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.width * .42,
                    child: const ClassField(),
                  ),
                  SizedBox(
                    width: context.width * .42,
                    child: DateOfBirthField(
                      dateOfBirthController: _dateOfBirthController,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: context.height * _verSpace,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final selectedGender = ref.watch(
                      addStudentRegistrationDetailsProvider
                          .select((value) => value.basicDetails.gender));
                  return DropdownButtonFormField(
                      value: selectedGender,
                      decoration: const InputDecoration(
                        labelText: "Gender *",
                      ),
                      items: List.generate(
                          Constants.gender.length,
                          (index) => DropdownMenuItem(
                              value: Constants.gender[index],
                              child: Text(Constants.gender[index]))),
                      onChanged: (value) {
                        ref
                            .read(
                                addStudentRegistrationDetailsProvider.notifier)
                            .addGender(value.toString());
                      });
                },
              ),

              SizedBox(
                height: context.height * _verSpace,
              ),

              Consumer(
                builder: (context, ref, child) {
                  final selectedBatch = ref.watch(
                      addStudentRegistrationDetailsProvider
                          .select((value) => value.basicDetails.batch));
                  return DropdownButtonFormField(
                      decoration: const InputDecoration(
                          labelText: "Batch *",
                          suffixIcon: Icon(Icons.batch_prediction)),
                      value: selectedBatch,
                      items: List.generate(
                        Constants.batchName.length,
                        (index) => DropdownMenuItem(
                          value: Constants.batchName[index],
                          child: Text(Constants.batchName[index]),
                        ),
                      ),
                      onChanged: (value) {
                        ref
                            .read(
                                addStudentRegistrationDetailsProvider.notifier)
                            .addBatch(value.toString());
                      });
                },
              ),
              // SizedBox(height: context.height * _verSpace),
              // TextFormField(
              //   decoration: const InputDecoration(
              //       labelText: "Aadhar No. *", suffixIcon: Icon(Icons.link)),
              // ),
              SizedBox(height: context.height * _verSpace),
              TextFormField(
                controller: _fatherNameController,
                decoration: const InputDecoration(
                    labelText: "Father's Name *",
                    suffixIcon: Icon(Icons.person)),
              ),
              SizedBox(height: context.height * _verSpace),
              TextFormField(
                controller: _motherNameController,
                decoration: const InputDecoration(
                    labelText: "Mother's Name *",
                    suffixIcon: Icon(Icons.person)),
              ),
              SizedBox(
                height: context.height * _verSpace,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.width * .42,
                    child: Consumer(
                      builder: (context, ref, child) {
                        final selectedCategory = ref.watch(
                            addStudentRegistrationDetailsProvider.select(
                                (value) => value.basicDetails.category));
                        return DropdownButtonFormField(
                          value: selectedCategory,
                          decoration: const InputDecoration(
                              labelText: "Category *",
                              suffixIcon: Icon(Icons.category)),
                          items: List.generate(
                            Constants.category.length,
                            (index) => DropdownMenuItem(
                              value: Constants.category[index],
                              child: Text(Constants.category[index]),
                            ),
                          ),
                          onChanged: (value) {
                            ref
                                .read(addStudentRegistrationDetailsProvider
                                    .notifier)
                                .addCategory(value.toString());
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: context.width * .42,
                    child: Consumer(
                      builder: (context, ref, child) {
                        final selectedNationality = ref.watch(
                            addStudentRegistrationDetailsProvider.select(
                                (value) => value.basicDetails.nationality));
                        return DropdownButtonFormField(
                          value: selectedNationality,
                          onChanged: (value) {
                            ref
                                .read(addStudentRegistrationDetailsProvider
                                    .notifier)
                                .addNationality(value.toString());
                          },
                          items: List.generate(
                              Constants.nationality.length,
                              (index) => DropdownMenuItem(
                                    value: Constants.nationality[index],
                                    child: Text(Constants.nationality[index]),
                                  )),
                          decoration: const InputDecoration(
                              labelText: "Nationality *",
                              suffixIcon: Icon(Icons.language)),
                        );
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: context.height * _verSpace),
              TextFormField(
                controller: _previousSchoolController,
                decoration: const InputDecoration(
                    labelText: "Previous School Name ",
                    suffixIcon: Icon(Icons.school)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
