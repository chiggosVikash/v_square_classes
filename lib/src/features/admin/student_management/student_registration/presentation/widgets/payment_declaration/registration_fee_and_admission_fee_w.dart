import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/presentation/providers/payment_declaration/add_payment_declaration_p.dart';
import '/src/widgets/text_field_design_w.dart';

class RegistrationFeeAndAdmissionFeeW extends ConsumerWidget {
  final double width;

  final TextEditingController _registrationFeeController;
  final TextEditingController _admissionFeeController;
  const RegistrationFeeAndAdmissionFeeW(
      {super.key,
      required this.width,
      required TextEditingController registrationFeeController,
      required TextEditingController admissionFeeController})
      : _admissionFeeController = admissionFeeController,
        _registrationFeeController = registrationFeeController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextFieldDesign(
            width: width,
            child: TextFormField(
              onChanged: (value) {
                ref
                    .read(addPaymentDeclarationProvider.notifier)
                    .calculateTotalFee(
                      registrationFee: _registrationFeeController.text,
                      admissionFee: _admissionFeeController.text,
                    );
              },
              controller: _registrationFeeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: "Registration Fee",
              ),
            )),
        TextFieldDesign(
          width: width,
          child: TextFormField(
            onChanged: (value) {
              ref
                  .read(addPaymentDeclarationProvider.notifier)
                  .calculateTotalFee(
                    registrationFee: _registrationFeeController.text,
                    admissionFee: _admissionFeeController.text,
                  );
            },
            controller: _admissionFeeController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: "Admission Fee",
            ),
          ),
        ),
      ],
    );
  }
}
