import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/src/features/admin/student_management/student_registration/domain/entities/student_registration_e.dart';
import '/src/extensions/context_extension.dart';

class StudentInfoCard extends StatelessWidget {

  final StudentRegistrationEntity _student;
  final Widget? trailing;
  const StudentInfoCard(
      {super.key,

        this.trailing,
      required StudentRegistrationEntity student})
      : _student = student;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.colorScheme.background,
          boxShadow: [
            BoxShadow(
                color: context.colorScheme.secondaryContainer,
                offset: const Offset(-2, 2),
                blurRadius: 2)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text.rich(TextSpan(children: [
          TextSpan(
              text: "${_student.basicDetails.studentName} | ", style: GoogleFonts.alegreyaSansSc()),
          TextSpan(
              text: "Form-No: ${_student.formNo}", style: Theme.of(context).textTheme.bodySmall)
        ])),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "${_student.basicDetails.standard} | Batch: ${_student.basicDetails.batch}",
            ),
            SizedBox(
              height: context.height * .005,
            ),
             Text("Reg no: ${_student.registrationNo}")
          ],
        ),
        leading:  CircleAvatar(
          radius: 30,
          backgroundImage: _student.basicDetails.imageUrl != null ? NetworkImage(
              _student.basicDetails.imageUrl!):null,
        ),
        trailing: trailing
      ),
    );
  }
}
