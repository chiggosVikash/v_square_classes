
import 'package:flutter/foundation.dart';

import '../../data/models/student_medical_information_model.dart';

@immutable
class StudentMedicalInformationEntity{
  final String bloodGroup;
  final String identificationMark;

  const StudentMedicalInformationEntity({
    required this.bloodGroup,
    required this.identificationMark
  });

  StudentMedicalInformationModel toModel() => StudentMedicalInformationModel(
    bloodGroup: bloodGroup,
    identificationMark: identificationMark,
  );
}