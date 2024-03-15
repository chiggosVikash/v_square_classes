import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/presentation/providers/payment_declaration/add_payment_declaration_p.dart';
import '/src/widgets/text_field_design_w.dart';

import '../../../../../../../constants/constants.dart';

class PaymentPeriodW extends ConsumerWidget {
  final double width;
  const PaymentPeriodW({super.key, required this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPaymentPeriod = ref.watch(addPaymentDeclarationProvider.select((value) => value.paymentPeriod));
    return TextFieldDesign(
      width: width,
      child: DropdownButtonFormField(
        value: selectedPaymentPeriod,
        onChanged: (value) {
          ref.read(addPaymentDeclarationProvider.notifier).assignPaymentPeriod(value!);
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: "Payment Period",
        ),
        items: List.generate(
          Constants.paymentPeriods.length,
          (index) => DropdownMenuItem(
            value: Constants.paymentPeriods[index],
            child: Text(Constants.paymentPeriods[index]),
          ),
        ),
      ),
    );
  }
}
