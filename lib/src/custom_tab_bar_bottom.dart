import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  final List<String> list;
  final TabController controller;
  final Color primary;
  final TextStyle labelStyle;
  final TextStyle unselectedLabelStyle;
  final EdgeInsetsGeometry indicatorPadding;
  final Color borderColor;
  final double paddingBottom;
  final EdgeInsetsGeometry padding;
  final TabBarIndicatorSize indicatorSize;
  final bool isScrollable;

  const CustomTabBarBottom(
      {Key key,
      @required this.list,
      this.controller,
      this.indicatorPadding,
      this.borderColor,
      this.paddingBottom: 0,
      this.primary,
      this.padding,
      @required this.labelStyle,
      this.unselectedLabelStyle,
      this.indicatorSize,
      this.isScrollable: false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.only(bottom: paddingBottom),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1.w, color: borderColor ?? Colors.transparent))),
      child: TabBar(
        controller: controller,
        tabs: list.map((element) => Tab(text: element)).toList(),
        isScrollable: isScrollable,
        labelPadding: EdgeInsets.zero,
        labelColor: primary ?? Theme.of(context).primaryColor,
        labelStyle: labelStyle,
        unselectedLabelStyle: unselectedLabelStyle,
        unselectedLabelColor: Color(0xff666666),
        indicatorSize: indicatorSize ?? TabBarIndicatorSize.label,
        indicatorColor: primary ?? Theme.of(context).primaryColor,
        indicatorPadding: indicatorPadding ?? EdgeInsets.zero,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kTextTabBarHeight + paddingBottom);
}
