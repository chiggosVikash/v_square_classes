import 'package:flutter/foundation.dart';

@immutable
class StudentPaymentDeclarationEntity {

  final String declarationDate;


  final String registrationNo;
  final String studentName;
  final String courseId;
  final String formNo;

  final String paymentPeriod;

  final double registrationFee;
  final double admissionFee;
  final double courseFee;
  final double totalFee;
  final double discount;
  final String discountType;
  final double netFee;


  const StudentPaymentDeclarationEntity({
    required this.declarationDate,
    required this.registrationNo,
    required this.studentName,
    required this.courseId,
    required this.formNo,
    required this.paymentPeriod,
    required this.registrationFee,
    required this.admissionFee,
    required this.courseFee,
    required this.totalFee,
    required this.discount,
    required this.discountType,
    required this.netFee,
  });

}
