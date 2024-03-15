import 'package:json_annotation/json_annotation.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/data/models/student_medical_information_model.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/domain/entities/student_registration_e.dart';

import 'student_registration_m.dart';
part 'student_registration_model.g.dart';

@JsonSerializable()
class StudentRegistrationModel extends StudentRegistrationEntity {
  const StudentRegistrationModel(
      {required DocumentModel documentDetails,
      required StudentMedicalInformationModel medicalInformation,
      required super.formNo,
      required super.registrationNo,
      required super.registrationDate,
      required BasicDetailsModel basicDetails,
      required AddressModel permanentAddress,
      required AddressModel correspondenceAddress})
      : super(
            medicalInformation: medicalInformation,
             documentDetails: documentDetails,
            basicDetails: basicDetails,
            correspondenceAddress: correspondenceAddress,
            permanentAddress: permanentAddress);


  factory StudentRegistrationModel.fromJson(Map<String, dynamic> json) => _$StudentRegistrationModelFromJson(json);


  Map<String, dynamic> toJson() => {
    'formNo': formNo,
    'registrationNo': registrationNo,
    'registrationDate': registrationDate,
    'basicDetails': basicDetails.toJson(),
    'permanentAddress': permanentAddress.toJson(),
    'correspondenceAddress': correspondenceAddress.toJson(),
    'documentDetails': documentDetails.toJson(),
    'medicalInformation': medicalInformation.toJson(),

  };

  StudentRegistrationModel copyWith({
    String? formNo,
    String? registrationNo,
    String? registrationDate,
    DocumentModel? documentDetails,
    StudentMedicalInformationModel? medicalInformation,
    BasicDetailsModel? basicDetails,
    AddressModel? permanentAddress,
    AddressModel? correspondenceAddress,
  }){
    return StudentRegistrationModel(
      formNo: formNo ?? this.formNo,
      registrationNo: registrationNo ?? this.registrationNo,
      registrationDate: registrationDate ?? this.registrationDate,
      documentDetails: documentDetails ?? this.documentDetails.toModel(),
      medicalInformation: medicalInformation ?? this.medicalInformation.toModel(),
      basicDetails: basicDetails ?? this.basicDetails.toModel(),
      permanentAddress: permanentAddress ?? this.permanentAddress.toModel(),
      correspondenceAddress: correspondenceAddress ?? this.correspondenceAddress.toModel(),
    );
  }
}
