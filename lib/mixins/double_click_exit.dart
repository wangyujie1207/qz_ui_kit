import '../utils/toast.dart';

mixin DoubleClickExit {
  DateTime lastPopTime;

  Future<bool> handlerExit({String text: "再按一次退出"}){
    if(lastPopTime == null || DateTime.now().difference(lastPopTime) > Duration(seconds: 2)){
      lastPopTime = DateTime.now();
      showToast(text);
      return new Future.value(false);
    }else{
      lastPopTime = DateTime.now();
      return Future.value(true);
    }
  }
}
