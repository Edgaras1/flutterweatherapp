import 'package:intl/intl.dart';

String formatDate(String dateString) {
  final DateTime date = DateTime.parse(dateString);
  final formattedDate = DateFormat('EEEE, MMM dd').format(date);
  return formattedDate;
}
