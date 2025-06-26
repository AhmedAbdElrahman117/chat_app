import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';

String checkDate(Timestamp date) {
  DateTime mDate = date.toDate();
  bool isToday = mDate.day == DateTime.now().day;
  if (isToday) {
    return formatDate(
      mDate,
      [h, ':', nn],
    );
  } else {
    return formatDate(
      mDate,
      [dd, '/', mm, '/', yyyy, ' ', h, ':', nn],
    );
  }
}
