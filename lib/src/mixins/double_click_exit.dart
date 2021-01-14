import 'package:qz_ui_kit/src/utils/toast.dart';

mixin DoubleClickExit {
  DateTime lastPopTime;

  Future<bool> handlerExit(){
    if(lastPopTime == null || DateTime.now().difference(lastPopTime) > Duration(seconds: 2)){
      lastPopTime = DateTime.now();
      showToast("再按一次退出");
      return new Future.value(false);
    }else{
      lastPopTime = DateTime.now();
      return Future.value(true);
    }
  }
}
