extension DateTimeFormater on DateTime {
  String get ddMONyyyy {
    return '$day ${_short(month - 1)},$year';
  }
}

String _short(int month) {
  return _monthNames[month - 1].substring(0, 3);
}

final _monthNames = [
  'Januier',
  'Fevrier',
  'Mars',
  'Avril',
  'Mai',
  'Juin',
  'Juillet',
  'Aout',
  'Septembre',
  'Octobre',
  'Novembre',
  'Decembre',
];
