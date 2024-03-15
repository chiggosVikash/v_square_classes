
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/student_registration_e.dart';
part 'student_medical_information_model.g.dart';

@JsonSerializable()
class StudentMedicalInformationModel extends StudentMedicalInformationEntity{
  const StudentMedicalInformationModel({required super.bloodGroup, required super.identificationMark});

  factory StudentMedicalInformationModel.fromJson(Map<String, dynamic> json) => _$StudentMedicalInformationModelFromJson(json);
  Map<String, dynamic> toJson() => _$StudentMedicalInformationModelToJson(this);

  StudentMedicalInformationModel copyWith({
    String? bloodGroup,
    String? identificationMark,
  }){
    return StudentMedicalInformationModel(
      bloodGroup: bloodGroup ?? this.bloodGroup,
      identificationMark: identificationMark ?? this.identificationMark,
    );
  }
}