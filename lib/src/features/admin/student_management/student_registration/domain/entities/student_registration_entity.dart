

import 'package:vsquareclasses/src/features/admin/student_management/student_registration/data/models/student_medical_information_model.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/data/models/student_registration_m.dart';

import 'student_registration_e.dart';

class StudentRegistrationEntity{

  final String formNo;
  final String registrationNo;
  final String registrationDate;

  final BasicDetailsModel basicDetails;
  final AddressModel permanentAddress;
  final AddressModel correspondenceAddress;
  final DocumentModel documentDetails;
  final StudentMedicalInformationModel medicalInformation;

  const StudentRegistrationEntity({
    required this.documentDetails,
    required this.medicalInformation,
    required this.formNo,
    required this.registrationNo,
    required this.registrationDate,
    required this.basicDetails,
    required this.permanentAddress,
    required this.correspondenceAddress
  });

  StudentRegistrationModel toModel() => StudentRegistrationModel(
    documentDetails: documentDetails.toModel(),
    medicalInformation: medicalInformation.toModel(),
    formNo: formNo,
    registrationNo: registrationNo,
    registrationDate: registrationDate,
    basicDetails: basicDetails.toModel(),
    permanentAddress: permanentAddress.toModel(),
    correspondenceAddress: correspondenceAddress.toModel(),
  );


}