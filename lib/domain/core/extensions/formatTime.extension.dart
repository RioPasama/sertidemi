import 'package:intl/intl.dart';

String timeFormatInCard(String time) {
  var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  var inputDate = inputFormat.parse(time);
  var day = DateFormat('d').format(inputDate);
  // var month = mothInID(DateFormat('MM').format(inputDate));
  var month = (DateFormat('MMM').format(inputDate));
  var year = DateFormat('yyy').format(inputDate);

  return ('$day $month $year');
}

String mothInID(String monthInt) {
  switch (monthInt) {
    case '01':
      return 'Januari';
    case '02':
      return 'Februari';
    case '03':
      return 'Maret';
    case '04':
      return 'April';
    case '05':
      return 'Mei';
    case '06':
      return 'Juni';
    case '07':
      return 'Juli';
    case '08':
      return 'Agustus';
    case '09':
      return 'September';
    case '10':
      return 'Oktober';
    case '11':
      return 'November';
    default:
      return 'Desember';
  }
}

String clockFormat(String time) {
  List<String> timeSplitList = time.split(' ');

  String clock = timeSplitList.last;

  return (clock);
}
