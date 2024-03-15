import 'package:intl/intl.dart';

extension DateFormatExtension on String {
  String get formattedDate {
    try {
      final date = DateTime.parse(this);
      return DateFormat('dd-MM-yyyy').format(date);
    } catch (e) {
      return "";
    }
  }

  String get onlyDay {
    try {
      final date = DateTime.parse(this);
      return DateFormat('dd').format(date);
    } catch (e) {
      return "Invalid Date";
    }
  }

  DateTime get toDate {
    try {
      return DateTime.parse(this);
    } catch (e, st) {
      throw Exception("DateFormat Exception Error $e, StackTrace $st");
    }
  }
}