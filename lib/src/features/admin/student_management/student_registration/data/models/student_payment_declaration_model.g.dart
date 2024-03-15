// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_payment_declaration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentPaymentDeclarationModel _$StudentPaymentDeclarationModelFromJson(
        Map<String, dynamic> json) =>
    StudentPaymentDeclarationModel(
      declarationDate: json['declarationDate'] as String,
      registrationNo: json['registrationNo'] as String,
      studentName: json['studentName'] as String,
      courseId: json['courseId'] as String,
      formNo: json['formNo'] as String,
      paymentPeriod: json['paymentPeriod'] as String,
      registrationFee: (json['registrationFee'] as num).toDouble(),
      admissionFee: (json['admissionFee'] as num).toDouble(),
      courseFee: (json['courseFee'] as num).toDouble(),
      totalFee: (json['totalFee'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      discountType: json['discountType'] as String,
      netFee: (json['netFee'] as num).toDouble(),
    );

Map<String, dynamic> _$StudentPaymentDeclarationModelToJson(
        StudentPaymentDeclarationModel instance) =>
    <String, dynamic>{
      'declarationDate': instance.declarationDate,
      'registrationNo': instance.registrationNo,
      'studentName': instance.studentName,
      'courseId': instance.courseId,
      'formNo': instance.formNo,
      'paymentPeriod': instance.paymentPeriod,
      'registrationFee': instance.registrationFee,
      'admissionFee': instance.admissionFee,
      'courseFee': instance.courseFee,
      'totalFee': instance.totalFee,
      'discount': instance.discount,
      'discountType': instance.discountType,
      'netFee': instance.netFee,
    };
