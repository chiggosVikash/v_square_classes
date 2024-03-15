import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:vsquareclasses/src/exceptions/student_registration_exception.dart';

import 'student_registration_remote_data_source.dart';
import '../../models/student_registration_model.dart';

class StudentRegistrationFirebaseDataSourceImpl
    implements StudentRegistrationRemoteDataSource {
  final _firesbaseFirestore = FirebaseFirestore.instance;
  @override
  Future<bool> deleteStudent({required String registrationNo}) {
    // TODO: implement deleteStudent
    throw UnimplementedError();
  }

  @override
  Future<StudentRegistrationModel> getStudent(
      {required String registrationNo}) {
    // TODO: implement getStudent
    throw UnimplementedError();
  }

  @override
  Future<bool> registerStudent(
      {required StudentRegistrationModel studentRegistrationModel}) async {
    try {
      await _firesbaseFirestore
          .collection("students")
          .doc(studentRegistrationModel.registrationNo)
          .set(studentRegistrationModel.toJson());
      return true;
    } on FirebaseException catch (e) {
      if(kDebugMode){
        print("Error while creating student registration details: ${e.message}");
      }
      throw StudentRegistrationCreationException(
          message: e.message ??
              "An error occurred while creating student registration details");
    } catch (e) {
      if(kDebugMode){
        print("Error while creating student registration details in catch: ${e.toString()}");
      }
      throw StudentRegistrationCreationException(message: e.toString());
    }
  }

  @override
  Future<bool> updateStudent(
      {required StudentRegistrationModel studentRegistrationModel}) async {
    try {
      await _firesbaseFirestore
          .collection("students")
          .doc(studentRegistrationModel.registrationNo)
          .update(studentRegistrationModel.toJson());
      return true;
    } on FirebaseException catch (e) {
      throw StudentRegistrationDeletionException(
          message: e.message ??
              "An error occurred while updating student registration details");
    } catch (e) {
      throw StudentRegistrationDeletionException(message: e.toString());
    }
  }

  @override
  Future<List<StudentRegistrationModel>> getStudentsLazy(
      {required int limit, required String lastRegistrationNo}) async{

    try {
      final studentRegistrationCollection = _firesbaseFirestore
          .collection("students")
          .orderBy("registrationNo", descending: true)
          .startAfter([lastRegistrationNo]).limit(limit);
      final students = await studentRegistrationCollection.get();
      return students.docs
          .map((e) => StudentRegistrationModel.fromJson(e.data()))
          .toList();
    }
    on FirebaseException catch(e){
      throw Exception(e.message);
    }
    catch (e) {
      if(kDebugMode){
        print("Error while fetching students in database call : ${e.toString()}");
      }
      rethrow;
    }
  }

  @override
  Future<List<StudentRegistrationModel>> getStudents({required int limit}) async{
    final studentRegistrationCollection = _firesbaseFirestore
        .collection("students")
        .orderBy("registrationNo", descending: true)
        .limit(limit);
    final students = await studentRegistrationCollection.get();
    return students.docs
        .map((e) => StudentRegistrationModel.fromJson(e.data()))
        .toList();

  }

  @override
  Future<bool> isFormNoValid({required String formNo}) async{
    final studentRegistrationCollection = _firesbaseFirestore
        .collection("students")
        .where("formNo", isEqualTo: formNo);
    final students = await studentRegistrationCollection.get();
    return students.docs.isEmpty ;

  }

  @override
  Future<bool> isRegistrationNoValid({required String registrationNo}) async{
    final studentRegistrationCollection = _firesbaseFirestore
        .collection("students")
        .where("registrationNo", isEqualTo: registrationNo);
    final students = await studentRegistrationCollection.get();
    return students.docs.isEmpty;
  }
}
