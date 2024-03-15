import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/document_entity.dart';
part 'document_model.g.dart';
@JsonSerializable()
class DocumentModel extends DocumentEntity {
  const DocumentModel(
      {required super.studentAadhaarNo,
      required super.fatherAadhaarNo,
      required super.motherAadhaarNo});

  factory DocumentModel.fromJson(Map<String, dynamic> json) => _$DocumentModelFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentModelToJson(this);

  DocumentModel copyWith({
    String? studentAadhaarNo,
    String? fatherAadhaarNo,
    String? motherAadhaarNo,
  }){
    return DocumentModel(
      studentAadhaarNo: studentAadhaarNo ?? this.studentAadhaarNo,
      fatherAadhaarNo: fatherAadhaarNo ?? this.fatherAadhaarNo,
      motherAadhaarNo: motherAadhaarNo ?? this.motherAadhaarNo,
    );
  }
}
