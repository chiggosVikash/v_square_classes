
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../../constants/constants.dart';
import '/src/features/admin/student_management/student_registration/domain/usecases/student_payment_declaration_usecase.dart';
import '/src/constants/enums/discount_type_enum.dart';

import '../../../data/models/student_payment_declaration_model.dart';

final addPaymentDeclarationProvider = AutoDisposeNotifierProvider<AddPaymentDeclarationP, StudentPaymentDeclarationModel>(
    () => AddPaymentDeclarationP());

class AddPaymentDeclarationP
    extends AutoDisposeNotifier<StudentPaymentDeclarationModel> {
  final _studentPaymentDeclarationDeclarationUseCase = StudentPaymentDeclarationUseCase();
  @override
  StudentPaymentDeclarationModel build() {
    return StudentPaymentDeclarationModel(
      declarationDate: DateTime.now().toString(),
      registrationNo: "",
      studentName: "",
      courseId: "",
      formNo: "",
      paymentPeriod: Constants.paymentPeriods[0],
      registrationFee: 0,
      admissionFee: 0,
      courseFee: 0,
      totalFee: 0,
      discount: 0,
      discountType: DiscountTypeEnum.percentage.name,
      netFee: 0,
    );
  }

  void assignStudentInfo({
    required String registrationNo,
    required String studentName,
    required String courseId,
    required String formNo,
  }) {
    state = state.copyWith(
      registrationNo: registrationNo,
      studentName: studentName,
      courseId: courseId,
      formNo: formNo,
    );
  }

  void assignPaymentPeriod(String paymentPeriod) {
    state = state.copyWith(paymentPeriod: paymentPeriod);
  }

  double calculateNetFee(
      {required String totalFee,
      required String discount,
      required DiscountTypeEnum discountType}) {
    final netFee = _studentPaymentDeclarationDeclarationUseCase.amountAfterDiscount(
        totalFee: totalFee.isEmpty ? 0 : double.parse(totalFee),
        discount: discount.isEmpty ? 0 : double.parse(discount),
        discountType: discountType);
    state = state.copyWith(netFee: netFee);

    return netFee;
  }

  double calculateTotalFee(
      {String? registrationFee,
      String? admissionFee,
      String? courseFee}) {
    final totalFee = _studentPaymentDeclarationDeclarationUseCase.calculateTotalFee(
        registrationFee: registrationFee ?? state.registrationFee.toString(),
        admissionFee: admissionFee ?? state.admissionFee.toString(),
        courseFee: courseFee ?? state.courseFee.toString());

    state = state.copyWith(totalFee: totalFee);
    return totalFee;
  }

  void assignPaymentDeclarationData({required String registrationFee, required String admissionFee,
    required String courseFee, required String discount,required String netFee, required String totalFee,
    required DiscountTypeEnum discountType,
  })
  {
    state = state.copyWith(
      discountType: discountType.name,
      registrationFee: registrationFee.isEmpty ? 0 : double.parse(registrationFee),
      admissionFee: admissionFee.isEmpty ? 0 : double.parse(admissionFee),
      courseFee: courseFee.isEmpty ? 0 : double.parse(courseFee),
      discount: discount.isEmpty ? 0 :double.parse(discount),
      netFee: netFee.isEmpty ? 0 : double.parse(netFee),
      totalFee: totalFee.isEmpty ? 0 : double.parse(totalFee),
    );
  }

  Future<bool> savePaymentDeclaration() async {
    return _studentPaymentDeclarationDeclarationUseCase.addPaymentDeclaration(studentPaymentDeclarationModel: state);
  }
}
