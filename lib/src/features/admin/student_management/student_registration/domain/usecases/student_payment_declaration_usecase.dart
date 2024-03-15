
import '../../../../../../constants/enums/discount_type_enum.dart';
import '../../data/models/student_payment_declaration_model.dart';
import '/src/features/admin/student_management/student_registration/data/data_sources/remote/student_payment_declaration_remote_data_source_impl.dart';
import '/src/features/admin/student_management/student_registration/data/repos/student_payment_declaration_repo_impl.dart';
import '/src/features/admin/student_management/student_registration/domain/repos/student_payment_declaration_repo.dart';

class StudentPaymentDeclarationUseCase{

  final StudentPaymentDeclarationRepo _studentPaymentDeclarationRepository = StudentPaymentDeclarationRepoImpl(
      studentPaymentDeclarationRemoteDataSource: StudentPaymentDeclarationRemoteDataSourceImpl());

  StudentPaymentDeclarationUseCase();

  Future<bool> addPaymentDeclaration({required StudentPaymentDeclarationModel studentPaymentDeclarationModel}) async{
    return _studentPaymentDeclarationRepository.addPaymentDeclaration(studentPaymentDeclarationModel: studentPaymentDeclarationModel);
  }

  double calculateTotalFee({required String registrationFee, required String admissionFee, required String courseFee}) {
    final  regFee = registrationFee.isEmpty ? 0.0 : double.parse(registrationFee);

    final admFee = admissionFee.isEmpty ? 0.0 : double.parse(admissionFee);
    final courFee = courseFee.isEmpty ? 0.0 : double.parse(courseFee);
    final totFee = regFee + admFee + courFee;
    return totFee;

  }

  double amountAfterDiscount({required double totalFee, required double discount, required DiscountTypeEnum discountType}){

    if(discountType == DiscountTypeEnum.percentage){
      final discountAmount =  totalFee * (discount / 100);
      return totalFee - discountAmount;
    }
    return totalFee - discount;
  }

  Future<StudentPaymentDeclarationModel?> getPaymentDeclaration({required String registrationNo}) async{
    return _studentPaymentDeclarationRepository.getPaymentDeclaration(registrationNo: registrationNo);
  }


}