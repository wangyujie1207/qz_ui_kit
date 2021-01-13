import 'package:flutter/material.dart';

class AppScrollView extends StatelessWidget {
  final ScrollPhysics physics;
  final EdgeInsets padding;
  final CrossAxisAlignment crossAxisAlignment;
  final List<Widget> children;

  const AppScrollView(
      {Key key,
      this.physics,
      this.padding,
      this.crossAxisAlignment,
      this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: physics,
      child: Container(
        padding: padding,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
