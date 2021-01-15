import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Field extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final bool readonly;
  final bool clearable;
  final bool autofocus;
  final List<TextInputFormatter> inputFormatters;
  final Widget prefixWidget;
  final Widget suffixWidget;
  final TextStyle style;
  final String type;
  final int rows;
  final String hintText;
  final TextStyle hintStyle;
  final bool isDense;
  final bool showEyes;
  final int maxLength;
  final TextStyle counterStyle;
  final ValueChanged<String> onSubmitted;
  final ValueChanged<String> onChanged;

  const Field(
      {Key key,
      this.controller,
      this.keyboardType,
      this.focusNode,
      this.readonly: false,
      this.clearable: true,
      this.autofocus: false,
      this.inputFormatters,
      this.prefixWidget,
      this.suffixWidget,
      this.style,
      this.type: "text",
      this.rows: 2,
      this.hintText,
      this.hintStyle,
      this.isDense: true,
      this.showEyes: true,
      this.maxLength,
      this.counterStyle,
      this.onSubmitted,
      this.onChanged})
      : super(key: key);

  @override
  _FieldState createState() => _FieldState();
}

class _FieldState extends State<Field> {
  bool _isShowPwd = false;
  bool _isShowDelete;

  @override
  void initState() {
    super.initState();

    _isShowDelete = widget.controller.text.isNotEmpty;

    widget.controller.addListener(() {
      if (mounted) {
        setState(() {
          _isShowDelete = widget.controller.text.isNotEmpty;
        });
      }
    });
  }

  Widget buildRight() {
    return Container(
      child: Row(
        children: <Widget>[
          widget.clearable && _isShowDelete
              ? SizedBox(width: 20.w)
              : Container(),
          widget.clearable && _isShowDelete
              ? GestureDetector(
                  child: Icon(Icons.cancel,
                      size: 16.0, color: const Color(0xffc8c9cc)),
                  onTap: () {
                    widget.controller.text = '';
                  },
                )
              : Container(),
          if (widget.type == "password") SizedBox(width: 20.w),
          widget.type == "password" && widget.showEyes
              ? GestureDetector(
                  child: Icon(
                      !_isShowPwd ? Icons.visibility_off : Icons.visibility,
                      size: 16.0,
                      color: const Color(0xff969799)),
                  onTap: () {
                    setState(() {
                      _isShowPwd = !_isShowPwd;
                    });
                  },
                )
              : Container(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        if (widget.prefixWidget != null) widget.prefixWidget,
        Expanded(
          child: TextField(
            maxLength: widget.maxLength,
            controller: widget.controller,
            focusNode: widget.focusNode,
            keyboardType: widget.keyboardType,
            autofocus: widget.autofocus,
            readOnly: widget.readonly,
            maxLines: widget.type == "textarea" ? widget.rows : 1,
            style: widget.style ??
                TextStyle(
                  fontSize: 24.sp,
                  color: Colors.black,
                ),
            inputFormatters: widget.inputFormatters,
            obscureText: widget.type == "password" ? !_isShowPwd : false,
            decoration: InputDecoration(
              isDense: widget.isDense,
              hintText: widget.hintText,
              counterStyle: widget.counterStyle,
              hintStyle: widget.hintStyle ??
                  TextStyle(
                    color: const Color(0xFFD3D3D3),
                    fontSize: 24.sp,
                  ),
              border: InputBorder.none,
            ),
            onSubmitted: widget.onSubmitted,
            onChanged: widget.onChanged,
          ),
        ),
        buildRight(),
        if (widget.suffixWidget != null) widget.suffixWidget,
      ],
    );
  }
}
