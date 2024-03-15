import 'package:json_annotation/json_annotation.dart';

import '/src/features/admin/student_management/student_registration/domain/entities/student_payment_declaration_entity.dart';
part 'student_payment_declaration_model.g.dart';

@JsonSerializable()
class StudentPaymentDeclarationModel extends StudentPaymentDeclarationEntity {
  const StudentPaymentDeclarationModel(
      {required super.declarationDate,
      required super.registrationNo,
      required super.studentName,
      required super.courseId,
      required super.formNo,
      required super.paymentPeriod,
      required super.registrationFee,
      required super.admissionFee,
      required super.courseFee,
      required super.totalFee,
      required super.discount,
      required super.discountType,
      required super.netFee});

  factory StudentPaymentDeclarationModel.fromJson(Map<String, dynamic> json) =>
      _$StudentPaymentDeclarationModelFromJson(json);
  Map<String, dynamic> toJson() => _$StudentPaymentDeclarationModelToJson(this);

  StudentPaymentDeclarationModel copyWith(
      {String? declarationDate,
      String? registrationNo,
      String? studentName,
      String? courseId,
      String? formNo,
      String? paymentPeriod,
      double? registrationFee,
      double? admissionFee,
      double? courseFee,
      double? totalFee,
      double? discount,
      String? discountType,
      double? netFee}) {
    return StudentPaymentDeclarationModel(
      declarationDate: declarationDate ?? super.declarationDate,
      registrationNo: registrationNo ?? super.registrationNo,
      studentName: studentName ?? super.studentName,
      courseId: courseId ?? super.courseId,
      formNo: formNo ?? super.formNo,
      paymentPeriod: paymentPeriod ?? super.paymentPeriod,
      registrationFee: registrationFee ?? super.registrationFee,
      admissionFee: admissionFee ?? super.admissionFee,
      courseFee: courseFee ?? super.courseFee,
      totalFee: totalFee ?? super.totalFee,
      discount: discount ?? super.discount,
      discountType: discountType ?? super.discountType,
      netFee: netFee ?? super.netFee,
    );
  }
}
