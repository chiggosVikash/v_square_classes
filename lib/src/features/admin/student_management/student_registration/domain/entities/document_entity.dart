import 'package:flutter/foundation.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/data/models/document_model.dart';

@immutable
class DocumentEntity {
  final String studentAadhaarNo;
  final String fatherAadhaarNo;
  final String motherAadhaarNo;

  const DocumentEntity({
    required this.studentAadhaarNo,
    required this.fatherAadhaarNo,
    required this.motherAadhaarNo,
  });

  DocumentModel toModel() => DocumentModel(
    studentAadhaarNo: studentAadhaarNo,
    fatherAadhaarNo: fatherAadhaarNo,
    motherAadhaarNo: motherAadhaarNo,
  );
}
