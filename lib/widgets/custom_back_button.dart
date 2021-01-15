import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  final Color color;
  final GestureTapCallback onTap;

  const CustomBackButton({Key key, this.color, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  IconButton(
      icon: const BackButtonIcon(),
      splashRadius: 50.w,
      color: color ?? Colors.black,
      onPressed: onTap ?? () {
        Navigator.maybePop(context);
      },
    );
  }
}
