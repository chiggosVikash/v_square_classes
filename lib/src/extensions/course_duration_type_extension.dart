import '../constants/enums/course_duration_enum.dart';

extension CourseDurationTypeExtension on CourseDurationType {
  List<String> get durationTypeList {
    return [
      'Month',
      'Year',
      'Week',
      'Daily',
      'Hour',
    ];
  }
}
