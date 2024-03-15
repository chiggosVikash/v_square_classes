import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/domain/entities/student_registration_e.dart';

import '../../providers/payment_declaration/get_payment_declaration_p.dart';
import '../../screens/payment_declaration_s.dart';

class PaymentDeclarationW extends ConsumerStatefulWidget {
  final StudentRegistrationEntity _student;
  const PaymentDeclarationW({super.key,required StudentRegistrationEntity student}) : _student = student;

  @override
  ConsumerState createState() => _PaymentDeclarationWState();
}

class _PaymentDeclarationWState extends ConsumerState<PaymentDeclarationW> {

  @override
  void initState() {
    super.initState();
    Future((){
      ref.read(getStudentPaymentDeclarationProvider.notifier).getPaymentDeclaration(registrationNo: widget._student.registrationNo);
    });

  }
  @override
  Widget build(BuildContext context) {
    ref.watch(getStudentPaymentDeclarationProvider);
    final isPaymentDeclarationExist = ref.watch(getStudentPaymentDeclarationProvider.notifier).isPaymentDeclarationExists(registrationNo: widget._student.registrationNo);

    return IconButton(
      visualDensity: VisualDensity.compact,
      onPressed: () {
        if(isPaymentDeclarationExist) return;
        context.pushNamed(PaymentDeclarationS.routeName,
            queryParameters: {
              "studentName": widget._student.basicDetails.studentName,
              "registrationNo": widget._student.registrationNo,
              "formNo": widget._student.formNo,
              "course": widget._student.basicDetails.standard,
            }
        );
      },
      icon: Icon(Icons.payment,color: !isPaymentDeclarationExist ? null : Colors.green,),
    );
  }
}
