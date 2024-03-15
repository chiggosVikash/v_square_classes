// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentRegistrationModel _$StudentRegistrationModelFromJson(
        Map<String, dynamic> json) =>
    StudentRegistrationModel(
      documentDetails: DocumentModel.fromJson(
          json['documentDetails'] as Map<String, dynamic>),
      medicalInformation: StudentMedicalInformationModel.fromJson(
          json['medicalInformation'] as Map<String, dynamic>),
      formNo: json['formNo'] as String,
      registrationNo: json['registrationNo'] as String,
      registrationDate: json['registrationDate'] as String,
      basicDetails: BasicDetailsModel.fromJson(
          json['basicDetails'] as Map<String, dynamic>),
      permanentAddress: AddressModel.fromJson(
          json['permanentAddress'] as Map<String, dynamic>),
      correspondenceAddress: AddressModel.fromJson(
          json['correspondenceAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentRegistrationModelToJson(
        StudentRegistrationModel instance) =>
    <String, dynamic>{
      'formNo': instance.formNo,
      'registrationNo': instance.registrationNo,
      'registrationDate': instance.registrationDate,
      'basicDetails': instance.basicDetails,
      'permanentAddress': instance.permanentAddress,
      'correspondenceAddress': instance.correspondenceAddress,
      'documentDetails': instance.documentDetails,
      'medicalInformation': instance.medicalInformation,
    };
