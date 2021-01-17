import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onPressed;
  final Widget child;
  final String title;
  final double radius;
  final Color background;
  final Gradient gradient;
  final Color disabledColor;
  final Color disabledTextColor;
  final Color splashColor;

  const Button({
    Key key,
    this.width,
    this.height,
    this.onPressed,
    this.child,
    this.radius,
    this.background,
    this.gradient,
    this.disabledColor,
    this.disabledTextColor,
    this.splashColor,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius _radius =
        radius != null ? BorderRadius.circular(radius) : BorderRadius.zero;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: background,
        borderRadius: _radius,
        gradient: gradient,
      ),
      child: FlatButton(
        disabledColor: disabledColor,
        disabledTextColor: disabledTextColor,
        splashColor: splashColor,
        padding: EdgeInsets.zero,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: _radius,
        ),
        onPressed: onPressed,
        child: child ??
            Text(
              title ?? ' ',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
      ),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final String title;
  final Color color;
  final Color borderColor;
  final Color highlightColor;
  final Color highlightedBorderColor;
  final Color splashColor;
  final Color disabledTextColor;
  final Color disabledBorderColor;
  final Widget child;
  final VoidCallback onPressed;

  const CustomOutlineButton(
      {Key key,
      this.width,
      this.height,
      this.radius,
      this.highlightedBorderColor,
      this.onPressed,
      this.child,
      this.borderColor,
      this.highlightColor,
      this.splashColor,
      this.title,
      this.color,
      this.disabledTextColor,
      this.disabledBorderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius _radius =
        radius != null ? BorderRadius.circular(radius) : BorderRadius.zero;
    Color _color = color ?? Theme.of(context).primaryColor;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(borderRadius: _radius),
      child: OutlineButton(
        shape: RoundedRectangleBorder(
          borderRadius: _radius,
        ),
        disabledTextColor: disabledTextColor,
        disabledBorderColor: disabledBorderColor,
        padding: EdgeInsets.zero,
        highlightedBorderColor: highlightedBorderColor,
        highlightColor: highlightColor ?? _color.withOpacity(0.2),
        splashColor: splashColor ?? _color.withOpacity(0.1),
        borderSide: BorderSide(width: 1.w, color: borderColor ?? _color),
        child: child ??
            Text(
              title ?? ' ',
              style: TextStyle(fontSize: 12, color: _color),
            ),
        onPressed: onPressed,
      ),
    );
  }
}
