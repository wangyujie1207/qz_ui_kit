mixin TimeUntil {
  String day = '00';
  String hours = '00';
  String minutes = '00';
  String seconds = '00';

  countDownEndTimeToString(String endTime, [Function callback]) {
    if(endTime == null) return;
    if(DateTime.now().isAfter(DateTime.tryParse(endTime))) return;
    int _start = DateTime.now().millisecondsSinceEpoch;
    int _end = DateTime.tryParse(endTime).millisecondsSinceEpoch;
    double difSeconds = (_end - _start) / 1000;

    String _day = (difSeconds / (24 * 60 * 60)).floor().toString();
    String _hours =
    (((difSeconds - int.tryParse(_day) * 60 * 60 * 24) / (60 * 60)))
        .floor()
        .toString()
        .padLeft(2, '0');
    String _minutes =
    ((difSeconds / 60) % 60).floor().toString().padLeft(2, '0');
    String _seconds = (difSeconds % 60).floor().toString().padLeft(2, '0');

    if (difSeconds < 0) {
      callback?.call();
    }

    day = _day;
    hours = _hours;
    minutes = _minutes;
    seconds = _seconds;
  }
}
