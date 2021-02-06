import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helper/size_box_entension.dart';

void showToast(String text, [int seconds = 2]) {
  BotToast.showText(
      text: text,
      duration: Duration(seconds: seconds),
      textStyle: const TextStyle(fontSize: 14, color: Colors.white));
}

CancelFunc showLoading({String text: "正在加载"}) {
  return BotToast.showCustomLoading(
    backgroundColor: Colors.transparent,
    toastBuilder: (void Function() cancelFunc) {
      // return SpinKitCircle(color: Colors.white);
      return CustomLoadingWidget(text: text);
    },
  );
}

class CustomLoadingWidget extends StatelessWidget {
  final String text;

  const CustomLoadingWidget({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.w,
      height: 90.w,
      decoration: BoxDecoration(
        color: const Color(0xff4c4c4c),
        border: Border.all(width: 1.w, color: const Color(0xffa5a5a5)),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 30.w,
            height: 30.w,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
              strokeWidth: 2.w,
            ),
          ),
          20.w.hb,
          Text(
            text,
            style: TextStyle(fontSize: 30.sp, color: Colors.white),
          )
        ],
      ),
    );
  }
}
