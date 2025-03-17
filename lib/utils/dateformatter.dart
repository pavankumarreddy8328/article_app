import 'package:intl/intl.dart';

class DateFormatter{
  static String formatDate(String dateString) {
  DateTime dateTime = DateTime.parse(dateString); // Parse the date
  String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime); // Format it
  return formattedDate;
}
}