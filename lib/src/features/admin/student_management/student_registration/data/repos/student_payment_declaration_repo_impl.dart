import '../data_sources/remote/student_payment_declaration_remote_data_source.dart';
import '/src/features/admin/student_management/student_registration/data/models/student_payment_declaration_model.dart';
import '../../domain/repos/student_payment_declaration_repo.dart';

class StudentPaymentDeclarationRepoImpl
    implements StudentPaymentDeclarationRepo {
  final StudentPaymentDeclarationRemoteDataSource
      _studentPaymentDeclarationRemoteDataSource;
  StudentPaymentDeclarationRepoImpl(
      {required StudentPaymentDeclarationRemoteDataSource
          studentPaymentDeclarationRemoteDataSource})
      : _studentPaymentDeclarationRemoteDataSource =
            studentPaymentDeclarationRemoteDataSource;


  @override
  Future<bool> addPaymentDeclaration(
      {required StudentPaymentDeclarationModel
          studentPaymentDeclarationModel}) {
    return _studentPaymentDeclarationRemoteDataSource.addPaymentDeclaration(
        studentPaymentDeclarationModel: studentPaymentDeclarationModel);
  }

  @override
  Future<StudentPaymentDeclarationModel?> getPaymentDeclaration({required String registrationNo}) {
    return _studentPaymentDeclarationRemoteDataSource.getPaymentDeclaration(registrationNo: registrationNo);
  }
}
