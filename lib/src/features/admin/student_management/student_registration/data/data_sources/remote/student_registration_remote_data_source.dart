
import '../../models/student_registration_m.dart';

abstract interface class StudentRegistrationRemoteDataSource {
   Future<bool> registerStudent({required StudentRegistrationModel studentRegistrationModel});
    Future<bool> updateStudent({required StudentRegistrationModel studentRegistrationModel});
    Future<bool> deleteStudent({required String registrationNo});
    Future<StudentRegistrationModel> getStudent({required String registrationNo});
    Future<List<StudentRegistrationModel>> getStudentsLazy({required int limit, required String lastRegistrationNo});
    Future<List<StudentRegistrationModel>> getStudents({required int limit});
    Future<bool> isRegistrationNoValid({required String registrationNo});
    Future<bool> isFormNoValid({required String formNo});
}