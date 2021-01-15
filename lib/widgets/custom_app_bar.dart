import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget customTitle;
  final Widget leading;
  final PreferredSizeWidget bottom;
  final List<Widget> actions;
  final Color backgroundColor;
  final BorderSide border;
  final Brightness brightness;

  const CustomAppBar({
    Key key,
    this.title,
    this.bottom,
    this.actions,
    this.backgroundColor,
    this.customTitle,
    this.leading,
    this.border,
    this.brightness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: border ?? BorderSide.none),
      ),
      child: AppBar(
          title: customTitle ??
              Text(
                title ?? " ",
                style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontSize: 38.sp,
                    fontWeight: FontWeight.bold),
              ),
          centerTitle: true,
          elevation: 0,
          leading: leading ??
              Container(
                margin: EdgeInsets.only(left: 20.w),
                child: IconButton(
                  icon: const BackButtonIcon(),
                  splashRadius: 50.w,
                  color: isDark ? Colors.white : Colors.black,
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                ),
              ),
          backgroundColor:
              backgroundColor ?? (isDark ? Colors.transparent : Colors.white),
          bottom: bottom,
          actions: actions,
          brightness:
              brightness ?? (isDark ? Brightness.dark : Brightness.light)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight +
      (bottom?.preferredSize?.height ?? 0.0) +
      (border == null ? 0.0 : 1.w));
}
