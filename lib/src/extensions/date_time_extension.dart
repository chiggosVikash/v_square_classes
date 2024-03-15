
extension DateTimeExtension on DateTime {
  DateTime get lastFourMonths {
    return DateTime(year, month - 4, day);
  }

  DateTime get lastThreeMonths {
    return DateTime(year, month - 3, day);
  }

  DateTime get lastYear {
    return DateTime(year - 1, month, day);
  }

  DateTime get lastSixMonths {
    return DateTime(year, month - 6, day);
  }

  DateTime addMonths(int months){
    return DateTime(year,month+months,day);
  }
}