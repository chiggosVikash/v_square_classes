import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/basic_details_entity.dart';
part 'basic_details_model.g.dart';

@JsonSerializable()
class BasicDetailsModel extends BasicDetailsEntity {
  const BasicDetailsModel(
      {required super.studentName,
      required super.standard,
      required super.batch,
      required super.gender,
      required super.dateOfBirth,
      required super.fatherName,
      required super.motherName,
      required super.category,
        super.imageUrl,
      required super.nationality,
      required super.previousSchool});

  factory BasicDetailsModel.fromJson(Map<String, dynamic> json) => _$BasicDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$BasicDetailsModelToJson(this);

  BasicDetailsModel copyWith({
    String? studentName,
    String? standard,
    String? batch,
    String? gender,
    String? dateOfBirth,
    String? fatherName,
    String? motherName,
    String? category,
    String? nationality,
    String? previousSchool,
    String? imageUrl
}){
    return BasicDetailsModel(
      studentName: studentName ?? this.studentName,
      standard: standard ?? this.standard,
      batch: batch ?? this.batch,
      category: category ?? this.category,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
      previousSchool: previousSchool ?? this.previousSchool,
      gender: gender ?? this.gender,
      nationality: nationality ?? this.nationality,
        imageUrl: imageUrl ?? this.imageUrl
    );
}
}
