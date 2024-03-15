import 'package:go_router/go_router.dart';
import 'package:vsquareclasses/src/features/admin/couse_management/presentation/screens/create_course_s.dart';
import 'package:vsquareclasses/src/features/admin/student_attendance_management/presentation/screen/student_attendance_s.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/presentation/screens/payment_declaration_s.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/presentation/screens/registread_student_view_s.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/presentation/screens/student_regisration_s.dart';
import 'package:vsquareclasses/src/features/homepage/presentation/screens/home_s.dart';

import '../../features/admin/homepage/presentation/screens/home_s.dart';

class AppRoute {
  final _router = GoRouter(routes: [
    GoRoute(
      path: HomepageS.routeAddress,
      name: HomepageS.routeName,
      builder: (context, state) => HomepageS(
        key: state.pageKey,
      ),
    ),

    /// admin home page
    GoRoute(
        path: HomeS.routeAddress,
        name: HomeS.routeName,
        builder: (context, state) => HomeS(key: state.pageKey),
        routes: [
          GoRoute(
            path: StudentAttendanceS.routeAddress,
            name: StudentAttendanceS.routeName,
            builder: (context, state) => StudentAttendanceS(
              key: state.pageKey,
            ),
          ),

          GoRoute(
            path: CreateCourseS.routeAddress,
            name: CreateCourseS.routeName,
            builder: (context, state) => CreateCourseS(
              key: state.pageKey,
            ),
          ),
          GoRoute(
            path: StudentRegistrationS.routeAddress,
            name: StudentRegistrationS.routeName,
            builder: (context, state) => StudentRegistrationS(
              key: state.pageKey,
            ),),
            GoRoute(
              path:RegisteredStudentViewS.routeAddress,
              name: RegisteredStudentViewS.routeName,
              builder: (context, state) => RegisteredStudentViewS(
                key: state.pageKey,
              ),
            ),

           GoRoute(path: PaymentDeclarationS.routeAddress,
              name: PaymentDeclarationS.routeName,
              builder: (context, state) {
                final studentName = state.uri.queryParameters['studentName'];
                final registrationNo = state.uri.queryParameters['registrationNo'];
                final formNo = state.uri.queryParameters['formNo'];
                final course = state.uri.queryParameters['course'];
                return PaymentDeclarationS(
                  key: state.pageKey,
                  studentName: studentName!,
                  registrationNo: registrationNo!,
                  formNo: formNo!,
                  course: course!,
                );
              }
            ),

        ]),
  ]);

  GoRouter get router => _router;
}
