
import '../../data/models/student_payment_declaration_model.dart';

abstract interface class StudentPaymentDeclarationRepo{
  Future<bool> addPaymentDeclaration({required StudentPaymentDeclarationModel studentPaymentDeclarationModel});
  Future<StudentPaymentDeclarationModel?> getPaymentDeclaration({required String registrationNo});
}