import 'package:flutter/foundation.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/data/models/basic_details_model.dart';

@immutable
class BasicDetailsEntity {
  final String studentName;
  final String standard;
  final String batch;
  final String gender;
  final String dateOfBirth;
  final String fatherName;
  final String motherName;
  final String category;
  final String nationality;
  final String previousSchool;
  final String? imageUrl;

  const BasicDetailsEntity(
      {required this.studentName,
      required this.standard,
      required this.batch,
      this.imageUrl,
      required this.gender,
      required this.dateOfBirth,
      required this.fatherName,
      required this.motherName,
      required this.category,
      required this.nationality,
      required this.previousSchool});


  BasicDetailsModel toModel() => BasicDetailsModel(
      studentName:studentName,
      standard:standard,
      batch:batch,
      imageUrl:imageUrl, gender: gender,
      dateOfBirth: dateOfBirth,
      fatherName: fatherName,
      motherName: motherName,
      category: category,
      nationality: nationality,
      previousSchool: previousSchool


  );
}
