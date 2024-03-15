import 'package:cloud_firestore/cloud_firestore.dart';
import '/src/features/admin/student_management/student_registration/data/models/student_payment_declaration_model.dart';
import '/src/features/admin/student_management/student_registration/data/data_sources/remote/student_payment_declaration_remote_data_source.dart';

class StudentPaymentDeclarationRemoteDataSourceImpl implements StudentPaymentDeclarationRemoteDataSource{
  final _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<bool> addPaymentDeclaration({required StudentPaymentDeclarationModel studentPaymentDeclarationModel}) async{
    try{
      final paymentDeclarationCollection = _firebaseFirestore.collection('student_payment_declaration');
      final response = await paymentDeclarationCollection.add(studentPaymentDeclarationModel.toJson());
      response.id.isNotEmpty? true : throw Exception('Failed to add payment declaration');
    } // try

    on FirebaseException catch(e){
      throw Exception(e.message);
    } // on FirebaseException
    catch(e){
      rethrow;
    } // catch

   return false;
  }

  @override
  Future<StudentPaymentDeclarationModel?> getPaymentDeclaration({required String registrationNo}) async{
   try{
     final paymentDeclarationCollection = _firebaseFirestore.collection('student_payment_declaration');
     final response = await paymentDeclarationCollection.where('registrationNo', isEqualTo: registrationNo).get();
     if(response.docs.isEmpty) return null;
     final data = response.docs.first.data();
     return StudentPaymentDeclarationModel.fromJson(data);
   } // try
    on FirebaseException catch(e){
      throw Exception(e.message);
    } // on FirebaseException
    catch(e){
      rethrow;
    } // catch
  } // addPaymentDeclaration
}