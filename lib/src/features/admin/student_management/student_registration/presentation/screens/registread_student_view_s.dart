import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/src/extensions/context_extension.dart';
import '/src/features/admin/student_management/student_registration/presentation/providers/payment_declaration/get_payment_declaration_p.dart';
import '/src/features/admin/student_management/student_registration/presentation/providers/registered_students_view/get_registered_students_p.dart';
import '/src/features/admin/student_management/student_registration/presentation/widgets/payment_declaration/payment_declaration_button_w.dart';

import '../../../../../../exceptions/student_registration_exception.dart';
import '../widgets/registered_student_widgets/filter_info_sheet.dart';
import '../widgets/registered_student_widgets/student_info_card.dart';

class RegisteredStudentViewS extends ConsumerStatefulWidget {
  static const routeAddress = "registeredStudentViewS";
  static const routeName = "registeredStudentViewS";
  const RegisteredStudentViewS({super.key});

  @override
  ConsumerState<RegisteredStudentViewS> createState() =>
      _RegisteredStudentViewSState();
}

class _RegisteredStudentViewSState
    extends ConsumerState<RegisteredStudentViewS> {
  final _scrollController = ScrollController();
  var _isBusy = false;

  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(getRegisteredStudentsProvider.notifier).getStudents(
            limit: 10,
          );
    });
    _getMoreStudents();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Description:
  ///
  /// Fetches additional student data when the user scrolls to the end of a list or scrollable viewport.
  /// Implements lazy loading functionality to enhance performance and reduce initial loading time.
  /// Key Points:
  ///
  /// Triggers on Scroll: The function is actively listening for scroll events using _scrollController.addListener().
  /// Loads More Data at Scroll End: When the user scrolls to the maximum extent (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent), it initiates the data fetching process.
  /// Prevents Duplicate Requests: Employs an _isBusy flag to ensure only one request is active at a time, avoiding unnecessary calls and potential errors.
  /// Retrieves Last Registration Number: Fetches the last registration number from the getRegisteredStudentsProvider.notifier to ensure data consistency and avoid duplicates.
  /// Fetches Students Lazily: Uses the getStudentsLazy method to retrieve student data incrementally, enhancing performance and user experience.
  /// Updates State: Manages the _isBusy flag to indicate when loading is in progress, which can be used for visual feedback or other UI updates.
  void _getMoreStudents() {
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        if (_isBusy) return;
        _isBusy = true;
        final lastRegistrationNo = await ref
            .read(getRegisteredStudentsProvider.notifier)
            .lastRegistrationNo();
        await ref.read(getRegisteredStudentsProvider.notifier).getStudentsLazy(
            limit: 10, lastRegistrationNo: lastRegistrationNo ?? "");
        _isBusy = false;
      }
    });
  }

  void _filterBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const FilterInfoSheet();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Students"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: () {
              _filterBottomSheet();
            },
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.sort))
        ],
      ),
      body: Container(
        color: context.colorScheme.secondaryContainer.withOpacity(.3),
        child: Consumer(
          builder: (context, ref, child) {
            final studentsValue = ref.watch(getRegisteredStudentsProvider);
            if (studentsValue.isLoading) {
              return const Center(
                child: RepaintBoundary(child: CircularProgressIndicator()),
              );
            }
            if (studentsValue.hasError) {
              final e =
                  studentsValue.error as StudentRegistrationFetchingException;
              return Center(
                child: Text(e.message),
              );
            }

            if (studentsValue.value?.isEmpty ?? true) {
              return const Center(
                child: Text("No students found"),
              );
            }
            return ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(
                    horizontal: context.width * .04,
                    vertical: context.height * .02),
                itemCount: studentsValue.value?.length ?? 0,
                itemBuilder: (context, index) {

                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: context.height * .01),
                    child: StudentInfoCard(
                      student: studentsValue.value![index],
                      trailing: Wrap(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            visualDensity: VisualDensity.compact,
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                          ),
                          // SizedBox(
                          //   height: context.height * .001,
                          // ),
                        PaymentDeclarationW(student: studentsValue.value![index],)
                        ],
                      ),

                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
