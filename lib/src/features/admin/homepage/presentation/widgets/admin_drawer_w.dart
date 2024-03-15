import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/src/features/admin/student_attendance_management/presentation/screen/student_attendance_s.dart';
import '/src/features/admin/couse_management/presentation/screens/create_course_s.dart';

import '../../../student_management/student_registration/presentation/screens/registread_student_view_s.dart';
import '../../../student_management/student_registration/presentation/screens/student_regisration_s.dart';

class AdminDrawerW extends StatelessWidget {
  const AdminDrawerW({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Vikash"),
            accountEmail: Text("royviku336@gmail.com"),
          ),
          ListTile(
            title: const Text("Register Student"),
            onTap: () {
              context.pushNamed(StudentRegistrationS.routeName);
            },
          ),
          ListTile(
            title: const Text("Create Course"),
            onTap: () {
              context.pushNamed(CreateCourseS.routeName);
            },
          ),

          ListTile(
            title: const Text("View Students"),
            onTap: () {
              context.pushNamed(RegisteredStudentViewS.routeName);
            },
          ),

          ListTile(
            title: const Text("Student Attendance"),
            onTap: () {
              context.pushNamed(StudentAttendanceS.routeName);
            },
          )
        ],
      ),
    );
  }
}
