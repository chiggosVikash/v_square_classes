import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/src/exceptions/course_management_exception.dart';
import '/src/extensions/context_extension.dart';
import '/src/features/admin/couse_management/data/models/course_model.dart';
import '/src/features/admin/couse_management/presentation/providers/add_course_management_data_p.dart';
import '/src/features/admin/couse_management/presentation/providers/image_picker_p.dart';

import '/src/widgets/dialogues/saving_dialogue_w.dart';
import '/src/widgets/dialogues/successful_dialogue_w.dart';

import '../../../../../widgets/dialogues/failed_dialogue_w.dart';
import '../providers/save_course_p.dart';
import '../widgets/create_course/class_field_w.dart';
import '../widgets/create_course/course_and_offer_price_field_w.dart';
import '../widgets/create_course/batch_field_w.dart';
import '../widgets/create_course/course_duration_and_type_w.dart';
import '../widgets/create_course/course_image_container_w.dart';
import '../widgets/create_course/course_name_w.dart';
import '../widgets/create_course/description_field_w.dart';
import '../widgets/create_course/id_course_language_w.dart';
import '../widgets/create_course/total_enrolled_save_course_button_w.dart';

class CreateCourseS extends ConsumerStatefulWidget {
  static const routeAddress = 'create-course';
  static const routeName = 'Create Course';
  final CourseModel? _course;
  const CreateCourseS({super.key, CourseModel? course}) : _course = course;

  @override
  ConsumerState<CreateCourseS> createState() => _CreateCourseSState();
}

class _CreateCourseSState extends ConsumerState<CreateCourseS> {
  final double _heighSpace = .02;

  final _courseIdController = TextEditingController();
  final _courseNameController = TextEditingController();
  final _durationController = TextEditingController();
  final _offerPriceController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _totalEnrolledController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _resetProviders();
    Future(() {
      if (widget._course == null) {
        ref.read(addCourseManagementDataProvider.notifier).createNewCourseId();
      }
    });
  }

  Future<void> _resetProviders() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.invalidate(imagePickerProvider);
      // ref.invalidate(addCourseManagementDataProvider);
    });
  }

  @override
  void dispose() {
    _courseNameController.dispose();
    _durationController.dispose();
    _courseIdController.dispose();
    _offerPriceController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _totalEnrolledController.dispose();
    super.dispose();
  }

  void _clearControllers() {
    _courseNameController.text = "";
    _durationController.text = "";
    _courseIdController.text = "";
    _offerPriceController.text = "";
    _priceController.text = "";
    _descriptionController.text = "";
    _totalEnrolledController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Course'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LayoutBuilder(builder: (context, constraints) {
            return ListView(
              shrinkWrap: true,
              children: [
                const CourseImageContainerW(),

                /// space between image and text fields
                SizedBox(
                  height: context.height * _heighSpace,
                ),

                /// Id and Course Language Field
                IdCourseLanguageW(
                  courseIdController: _courseIdController,
                  constraints: constraints,
                ),

                SizedBox(
                  height: context.height * _heighSpace,
                ),

                /// Course Name Field
                CourseNameW(
                    constraints: constraints,
                    courseNameController: _courseNameController),

                SizedBox(
                  height: context.height * _heighSpace,
                ),

                /// Class Field
                ClassFieldW(constraints: constraints),

                SizedBox(
                  height: context.height * _heighSpace,
                ),

                /// Batch Field
                BatchFieldW(constraints: constraints),

                SizedBox(
                  height: context.height * _heighSpace,
                ),

                /// Course and Offer Price Fields
                CourseAndOfferPriceFieldsW(
                    constraints: constraints,
                    priceController: _priceController,
                    offerPriceController: _offerPriceController),

                SizedBox(
                  height: context.height * _heighSpace,
                ),

                /// Course Duration and Type
                CourseDurationAndType(
                    constraints: constraints,
                    durationController: _durationController),

                SizedBox(
                  height: context.height * _heighSpace,
                ),

                /// Description Field
                DescriptionFieldW(
                    width: constraints.maxWidth,
                    descriptionController: _descriptionController),

                SizedBox(
                  height: context.height * _heighSpace,
                ),

                TotalEnrolledSaveCourseButtonW(
                  onPressed: () {
                    ref
                        .read(addCourseManagementDataProvider.notifier)
                        .assignCourseFields(
                            courseName: _courseNameController.text,
                            description: _descriptionController.text,
                            price: _priceController.text,
                            offerPrice: _offerPriceController.text,
                            duration: _durationController.text,
                            totalEnrolled: _totalEnrolledController.text);
                    _showSaveStatusDiogue();
                    ref
                        .read(addCourseManagementDataProvider.notifier)
                        .saveCourse();
                  },
                  totalEnrolledController: _totalEnrolledController,
                  width: constraints.maxWidth,
                ),

                SizedBox(
                  height: context.height * _heighSpace,
                ),
              ],
            );
          }),
        ));
  }

  void _showSaveStatusDiogue() {
    showDialog(
        context: context,
        builder: (context) {
          return Consumer(builder: (context, ref, child) {
            final saveResult = ref.watch(saveCourseProvider);
            if (saveResult.isLoading) {
              return SavingDialogue(title: 'Saving Course');
            }
            if (saveResult.hasError) {
              final e = saveResult.error as CourseCreationException;
              return FailedDialogue(
                  message: e.message,
                  cancelButton: () {
                    Navigator.pop(context);
                  });
            }
            return SuccessfulDialogue(
                content: "Successful",
                onPressed: () {
                  Navigator.pop(context);
                  _clearControllers();
                  _resetProviders();

                  Future(() {
                    ref
                        .read(addCourseManagementDataProvider.notifier)
                        .createNewCourseId();
                  });
                });
          });
        });
  }
}
