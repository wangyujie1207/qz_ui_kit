import 'package:flutter/material.dart';

class CircleSplashIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;

  const CircleSplashIconButton({Key key, this.icon, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1000),
        child: Material(
          color: Colors.transparent,
          child: IconButton(icon: icon, onPressed: onPressed),
        ),
      ),
    );
  }
}