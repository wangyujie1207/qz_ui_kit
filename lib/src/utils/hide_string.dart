import 'dart:math';

String hideString(String str, int start, int end, {String hideText = '*'}) {
  if(str == null) return ' ';
  start = max(0, start);
  start = min(start, str.length - 1);

  end = max(0, end);
  end = min(end, str.length - 1);

  final s = min(start, end);
  final e = max(start, end);

  return str.substring(0, s) +
      List.filled(e - s, hideText).join() +
      str.substring(e);
}