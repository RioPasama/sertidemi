import 'package:intl/intl.dart';

String currencyRp(String currency) {
  NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  return currencyFormatter.format(int.parse(currency));
}
