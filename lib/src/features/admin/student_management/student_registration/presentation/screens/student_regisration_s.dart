import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../exceptions/student_registration_exception.dart';
import '../providers/add_student_registration_details_p.dart';
import '/src/dialogue/dialogue.dart';
import '/src/extensions/context_extension.dart';
import '/src/features/admin/couse_management/presentation/providers/image_picker_p.dart';
import '../providers/save_student_registration_p.dart';
import '../widgets/address_info_w.dart';
import '../widgets/basic_details_w.dart';
import '../widgets/save_details_button_w.dart';

import '../../../../../../constants/enums/address_type_enum.dart';
import '../widgets/document_info_w.dart';
import '../widgets/medical_info_w.dart';
import '../widgets/office_use_details_w.dart';
import '../widgets/student_image_w.dart';

// @immutable
// class NewAdmissionArgs{
//   final EnquiryModel? enquiryModel;
//   const NewAdmissionArgs({this.enquiryModel});
// }

class StudentRegistrationS extends ConsumerStatefulWidget {
  static const routeAddress = "student-registration";
  static const routeName = "New Registration";
  // final NewAdmissionArgs _args;
  // const NewAdmissionS({super.key,required NewAdmissionArgs args}):_args = args;
  const StudentRegistrationS({Key? key}) : super(key: key);

  @override
  ConsumerState<StudentRegistrationS> createState() =>
      _StudentRegistrationSState();
}

class _StudentRegistrationSState extends ConsumerState<StudentRegistrationS> {
  final double _verSpace = .02;

  // /// text field controllers
  final _formNoController = TextEditingController();
  final _registrationNoController = TextEditingController();
  final _registrationDateController = TextEditingController();

  /// basic details controllers

  final _nameController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _fatherNameController = TextEditingController();
  final _motherNameController = TextEditingController();
  final _previousSchoolController = TextEditingController();

  /// documents controllers
  final _studentAadhaarNoController = TextEditingController();
  final _fatherAadhaarNoController = TextEditingController();
  final _motherAadhaarNoController = TextEditingController();

  /// corresponding address controllers
  final _correspondingAreaController = TextEditingController();
  final _correspondingLandmarkController = TextEditingController();
  final _correspondingCityController = TextEditingController();
  final _correspondingStateController = TextEditingController();
  final _correspondingPinCodeController = TextEditingController();

  /// permanent address controllers
  final _permanentAreaController = TextEditingController();
  final _permanentLandmarkController = TextEditingController();
  final _permanentCityController = TextEditingController();
  final _permanentStateController = TextEditingController();
  final _permanentPinCodeController = TextEditingController();

  /// medical information controller
  final _identificationMarkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _resetProviders();
  }

  @override
  void dispose() {
    /// basic details controller
    _dateOfBirthController.dispose();
    _nameController.dispose();
    _fatherNameController.dispose();
    _motherNameController.dispose();
    _previousSchoolController.dispose();

    /// office uses controller
    _formNoController.dispose();
    _registrationDateController.dispose();
    _registrationNoController.dispose();

    /// document controller
    _studentAadhaarNoController.dispose();
    _fatherAadhaarNoController.dispose();
    _motherAadhaarNoController.dispose();

    /// corresponding address controller
    _correspondingAreaController.dispose();
    _correspondingLandmarkController.dispose();
    _correspondingCityController.dispose();
    _correspondingStateController.dispose();
    _correspondingPinCodeController.dispose();

    /// permanent address controller
    _permanentAreaController.dispose();
    _permanentLandmarkController.dispose();
    _permanentCityController.dispose();
    _permanentStateController.dispose();
    _permanentPinCodeController.dispose();

    /// medical information controller
    _identificationMarkController.dispose();

    super.dispose();
  }

  void _resetProviders() {
    Future(() {
      ref.invalidate(imagePickerProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
      ),
      body: Container(
        color: context.colorScheme.secondaryContainer.withOpacity(.3),
        child: ListView(
          children: [
            Stack(
              children: [
                OfficeUseDetails(
                  formNoController: _formNoController,
                  registrationDateController: _registrationDateController,
                  registrationNoController: _registrationNoController,
                ),
                const StudentImage(),
              ],
            ),
            SizedBox(
              height: context.height * _verSpace,
            ),
            BasicDetails(
              dateOfBirthController: _dateOfBirthController,
              fatherNameController: _fatherNameController,
              motherNameController: _motherNameController,
              nameController: _nameController,
              previousSchoolController: _previousSchoolController,
            ),
            SizedBox(
              height: context.height * _verSpace,
            ),
            DocumentInfoW(
              studentAadhaarNoController: _studentAadhaarNoController,
              fatherAadhaarNoController: _fatherAadhaarNoController,
              motherAadhaarNoController: _motherAadhaarNoController,
            ),
            SizedBox(
              height: context.height * _verSpace,
            ),

            /// corresponding address
            AddressInfo(
              areaController: _correspondingAreaController,
              cityController: _correspondingCityController,
              landmarkController: _correspondingLandmarkController,
              pinCodeController: _correspondingPinCodeController,
              addressType: "Corresponding Address",
              addressTypeEnum: AddressTypeEnum.correspondenceAddress,
              stateController: _correspondingStateController,
            ),
            SizedBox(
              height: context.height * _verSpace,
            ),

            /// permanent address
            AddressInfo(
              areaController: _permanentAreaController,
              cityController: _permanentCityController,
              landmarkController: _permanentLandmarkController,
              pinCodeController: _permanentPinCodeController,
              stateController: _permanentStateController,
              addressType: "Permanent Address",
              addressTypeEnum: AddressTypeEnum.permanentAddress,
              onSameAddressConfirmation:
                  _markPermanentAddressSameAsCorresponding,
            ),
            SizedBox(
              height: context.height * _verSpace,
            ),
            MedicalInfo(
              verSpace: _verSpace,
              identificationMark: _identificationMarkController,
            ),
            SizedBox(
              height: context.height * _verSpace,
            ),
            Center(child: SaveDetailsButton(
              onPressed: () {
                _showSaveStatusDialogue();
                ref
                    .read(addStudentRegistrationDetailsProvider.notifier)
                    .addStudentRegistrationDetails(
                        formNo: _formNoController.text,
                        registrationNo: _registrationNoController.text,
                        registrationDate: _registrationDateController.text,
                        studentName: _nameController.text,
                        fatherName: _fatherNameController.text,
                        motherName: _motherNameController.text,
                        dateOfBirth: _dateOfBirthController.text,
                        previousSchool: _previousSchoolController.text,
                        studentAadhaarNo: _studentAadhaarNoController.text,
                        fatherAadhaarNo: _fatherAadhaarNoController.text,
                        motherAadhaarNo: _motherAadhaarNoController.text,
                        correspondingArea: _correspondingAreaController.text,
                        correspondingLandmark: _correspondingLandmarkController.text,
                        correspondingCity: _correspondingCityController.text,
                        correspondingState: _correspondingStateController.text,
                        correspondingPinCode: _correspondingPinCodeController.text,
                        permanentArea: _permanentAreaController.text,
                        permanentLandmark: _permanentLandmarkController.text,
                        permanentCity: _permanentCityController.text,
                        permanentState: _permanentStateController.text,
                        permanentPinCode: _permanentPinCodeController.text,
                        identificationMark: _identificationMarkController.text);
                ref.read(addStudentRegistrationDetailsProvider.notifier).saveStudentRegistrationDetails();
              },
            )),
            SizedBox(
              height: context.height * _verSpace,
            ),
          ],
        ),
      ),
    );
  }

  void _markPermanentAddressSameAsCorresponding(bool isSame) {
    if (isSame) {
      _permanentAreaController.text = _correspondingAreaController.text;
      _permanentLandmarkController.text = _correspondingLandmarkController.text;
      _permanentCityController.text = _correspondingCityController.text;
      _permanentStateController.text = _correspondingStateController.text;
      _permanentPinCodeController.text = _correspondingPinCodeController.text;
    } else {
      _permanentAreaController.text = "";
      _permanentLandmarkController.text = "";
      _permanentCityController.text = "";
      _permanentStateController.text = "";
      _permanentPinCodeController.text = "";
    }
  }

  void _clearControllers(){
    _formNoController.text = '';
    _registrationNoController.text = '';
    _registrationDateController.text = '';
    _nameController.text = '';
    _dateOfBirthController.text = '';
    _fatherNameController.text = '';
    _motherNameController.text = '';
    _previousSchoolController.text = '';
    _studentAadhaarNoController.text = '';
    _fatherAadhaarNoController.text = '';
    _motherAadhaarNoController.text = '';
    _correspondingAreaController.text = '';
    _correspondingLandmarkController.text = '';
    _correspondingCityController.text = '';
    _correspondingStateController.text = '';
    _correspondingPinCodeController.text = '';
    _permanentAreaController.text = '';
    _permanentLandmarkController.text = '';
    _permanentCityController.text = '';
    _permanentStateController.text = '';
    _permanentPinCodeController.text = '';
    _identificationMarkController.text = '';

  }

  void _showSaveStatusDialogue(){
    showDialog(context: context, builder: (context){
      return Consumer(builder: (context,ref,child){
        final saveResult = ref.watch(saveStudentRegistrationProvider);
        if(saveResult.isLoading){
          return const SavingDialogue(title: 'Saving Student Registration',);
        }
        if(saveResult.hasError || saveResult.value == false){
          String message;
          if(saveResult.error is StudentRegistrationCreationException) {
            message = (saveResult.error as StudentRegistrationCreationException)
                .message;
          }
            else if(saveResult.error is StudentRegistrationCreationException) {
            message = (saveResult.error as StudentRegistrationCreationException)
                .message;
          }
          else{
            message = saveResult.error.toString();
          }
          return FailedDialogue(message: message, cancelButton: (){
            context.pop();
          }, tryAgainButton: (){
            ref.read(addStudentRegistrationDetailsProvider.notifier).saveStudentRegistrationDetails();
          });
        }

          return SuccessfulDialogue(content: "Student Registration Saved Successfully", onPressed: (){
            context.pop();
            _clearControllers();
            _resetProviders();
          });

      },);
    });
  }
}
