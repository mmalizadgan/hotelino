import 'package:intl/intl.dart';

String priceFormater(int price) {
  final formater = NumberFormat.decimalPattern("fa");
  return formater.format(price);
}
