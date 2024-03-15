import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/data/models/address_model.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/data/models/basic_details_model.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/data/models/document_model.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/data/models/student_medical_information_model.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/data/models/student_registration_m.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/presentation/providers/save_student_registration_p.dart';

import '../../../../../../constants/constants.dart';
import '../../domain/entities/student_registration_e.dart';

final addStudentRegistrationDetailsProvider =
    NotifierProvider<AddStudentRegistrationDetailsP, StudentRegistrationModel>(
        () => AddStudentRegistrationDetailsP());

class AddStudentRegistrationDetailsP
    extends Notifier<StudentRegistrationModel> {
  @override
  StudentRegistrationModel build() {
    return StudentRegistrationModel(
        documentDetails: const DocumentModel(
            studentAadhaarNo: '', fatherAadhaarNo: '', motherAadhaarNo: ''),
        medicalInformation: StudentMedicalInformationModel(
            bloodGroup: Constants.bloodGroup[0], identificationMark: ''),
        formNo: "",
        registrationNo: "",
        registrationDate: DateTime.now().toIso8601String(),
        basicDetails: BasicDetailsModel(
          studentName: "",
          fatherName: "",
          motherName: "",
          dateOfBirth: "",
          standard: Constants.className[0],
          batch: Constants.batchName[0],
          category: Constants.category[0],
          nationality: Constants.nationality[0],
          previousSchool: '',
          gender: Constants.gender[0],
        ),
        permanentAddress: const AddressModel(
            area: '', landmark: '', city: '', state: '', pinCode: ''),
        correspondenceAddress: const AddressModel(
            area: '', landmark: '', city: '', state: '', pinCode: ''));
  }

  void addBatch(String batch) {
    state =
        state.copyWith(basicDetails: state.basicDetails.copyWith(batch: batch));
  }

  void addStandard(String standard) {
    state = state.copyWith(
        basicDetails: state.basicDetails.copyWith(standard: standard));
  }

  void addGender(String gender) {
    state = state.copyWith(
        basicDetails: state.basicDetails.copyWith(gender: gender));
  }

  void addCategory(String category) {
    state = state.copyWith(
        basicDetails: state.basicDetails.copyWith(category: category));
  }

  void addNationality(String nationality) {
    state = state.copyWith(
        basicDetails: state.basicDetails.copyWith(nationality: nationality));
  }

  void addDateOfBirth(String dateOfBirth) {
    state = state.copyWith(
        basicDetails: state.basicDetails.copyWith(dateOfBirth: dateOfBirth));
  }

  void addBloodGroup(String bloodGroup) {
    state = state.copyWith(
        medicalInformation:
            state.medicalInformation.copyWith(bloodGroup: bloodGroup));
  }


  void addStudentRegistrationDetails({
    required String formNo,
    required String registrationNo,
    required String registrationDate,

    required String studentName,
    required String fatherName,
    required String motherName,
    required String dateOfBirth,
    required String previousSchool,

    required String studentAadhaarNo,
    required String fatherAadhaarNo,
    required String motherAadhaarNo,

    required String correspondingArea,
    required String correspondingLandmark,
    required String correspondingCity,
    required String correspondingState,
    required String correspondingPinCode,

    required String permanentArea,
    required String permanentLandmark,
    required String permanentCity,
    required String permanentState,
    required String permanentPinCode,

    required String identificationMark,
  }) {
    state = state.copyWith(
      formNo: formNo,
      registrationNo: registrationNo,
      registrationDate: registrationDate,
      basicDetails: state.basicDetails.copyWith(
        studentName: studentName,
        fatherName: fatherName,
        motherName: motherName,
        dateOfBirth: dateOfBirth,
        previousSchool: previousSchool,
      ),
      documentDetails: state.documentDetails.copyWith(
        studentAadhaarNo: studentAadhaarNo,
        fatherAadhaarNo: fatherAadhaarNo,
        motherAadhaarNo: motherAadhaarNo,
      ),
      permanentAddress: state.permanentAddress.copyWith(
        area: permanentArea,
        landmark: permanentLandmark,
        city: permanentCity,
        state: permanentState,
        pinCode: permanentPinCode,
      ),
      correspondenceAddress: state.correspondenceAddress.copyWith(
        area: correspondingArea,
        landmark: correspondingLandmark,
        city: correspondingCity,
        state: correspondingState,
        pinCode: correspondingPinCode,
      ),
      medicalInformation: state.medicalInformation.copyWith(
        identificationMark: identificationMark,
      ),
    );
  }

  void saveStudentRegistrationDetails() {
    ref.read(saveStudentRegistrationProvider.notifier).registerStudent(studentRegistrationModel: state);
  }
}
