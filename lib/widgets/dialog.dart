import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///自定义Dialog
class NDialog extends StatefulWidget {
  // 弹窗标题
  final String title;

  // 弹窗内容
  final String message;

  // 标题对齐方式
  final AlignmentDirectional titleAlign;

  // 内容对齐方式
  final TextAlign messageAlign;

  // 是否展示确认按钮
  final bool showConfirmButton;

  // 是否展示取消按钮
  final bool showCancelButton;

  // 确认按钮文案
  final String confirmButtonText;

  // 确认按钮颜色
  final Color confirmButtonColor;

  // 确认按钮文本颜色
  final Color confirmTextColor;

  // 取消按钮文案
  final String cancelButtonText;

  // 取消按钮颜色
  final Color cancelButtonColor;

  // 取消按钮文本颜色
  final Color cancelTextColor;

  // 是否在点击遮罩层后关闭弹窗
  final bool closeOnClickOverlay;

  // 点击确认按钮时触发
  final Function() onConfirm;

  // 点击取消按钮时触发
  final Function() onCancel;

  // 关闭前的回调函数
  final Function() beforeClose;

  // 自定义内容
  final Widget child;

  // 背景色
  final Color background;

  // border
  final Color borderColor;

  // 标题颜色
  final Color titleColor;

  // 内容颜色
  final Color contentColor;


  const NDialog(
      {Key key,
      this.title,
      this.message,
      this.titleAlign: AlignmentDirectional.center,
      this.messageAlign: TextAlign.center,
      this.showConfirmButton: true,
      this.showCancelButton: false,
      this.confirmButtonText: "确认",
      this.confirmButtonColor: Colors.white,
      this.confirmTextColor: const Color(0xff1989fa),
      this.cancelButtonText: "取消",
      this.cancelButtonColor: Colors.white,
      this.cancelTextColor: const Color(0xff323233),
      this.closeOnClickOverlay: false,
      this.onConfirm,
      this.onCancel,
      this.beforeClose,
      this.child,
      this.background,
      this.borderColor, this.titleColor, this.contentColor})
      : super(key: key);

  @override
  _NDialog createState() => _NDialog();
}

class _NDialog extends State<NDialog> {
  bool _confirmLoading = false;

  confirmDialog() async {
    if (widget.beforeClose != null) {
      setState(() {
        _confirmLoading = true;
      });
      await widget.beforeClose();
    }
    setState(() {
      _confirmLoading = false;
    });
//    hideDialog();
    Navigator.of(context).pop('confirm');
    if (widget.onConfirm != null) {
      widget.onConfirm();
    }
  }

  hideDialog() async {
    if (widget.onCancel != null) {
      widget.onCancel();
    }
    Navigator.of(context).pop();
  }

  Widget buildCancelButton() {
    return DecoratedBox(
        decoration: BoxDecoration(
            color: widget.cancelButtonColor,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.w))),
        child: Material(
            type: MaterialType.transparency,
            child: InkWell(
                onTap: hideDialog,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(20.w)),
                child: Container(
                    height: 100.w,
                    alignment: Alignment.center,
                    child: Text(widget.cancelButtonText,
                        style: TextStyle(
                          fontSize: 30.sp,
                          color: widget.cancelTextColor,
                        ))))));
  }

  Widget buildConfirmButton() {
    return DecoratedBox(
        decoration: BoxDecoration(
            color: widget.confirmButtonColor,
            borderRadius: widget.showCancelButton
                ? BorderRadius.only(bottomRight: Radius.circular(20.w))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(20.w),
                    bottomRight: Radius.circular(20.w))),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
              onTap: confirmDialog,
              focusColor: _confirmLoading
                  ? Colors.transparent
                  : Theme.of(context).focusColor,
              highlightColor: _confirmLoading
                  ? Colors.transparent
                  : Theme.of(context).highlightColor,
              hoverColor: _confirmLoading
                  ? Colors.transparent
                  : Theme.of(context).hoverColor,
              splashColor: _confirmLoading
                  ? Colors.transparent
                  : Theme.of(context).splashColor,
              borderRadius: widget.showCancelButton
                  ? BorderRadius.only(bottomRight: Radius.circular(20.w))
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(20.w),
                      bottomRight: Radius.circular(20.w)),
              child: Container(
                height: 100.w,
                alignment: Alignment.center,
                child: _confirmLoading
                    ? SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation(widget.confirmTextColor),
                          backgroundColor: widget.confirmButtonColor,
                          strokeWidth: 1,
                        ),
                      )
                    : Text(widget.confirmButtonText,
                        style: TextStyle(
                          fontSize: 30.sp,
                          color: widget.confirmTextColor,
                        )),
              )),
        ));
  }

  Widget buildButtons() {
    return Container(
        child: Row(
      children: <Widget>[
        Expanded(
            child: widget.showCancelButton ? buildCancelButton() : Text(''),
            flex: widget.showCancelButton ? 1 : 0),
        SizedBox(
            width: widget.showCancelButton ? 1 : 0,
            height: 100.w,
            child: Container(color: widget.borderColor ?? Color(0xffebedf0))),
        Expanded(
            child:
                widget.showConfirmButton ? buildConfirmButton() : Container(),
            flex: widget.showConfirmButton ? 1 : 0),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    Column _buildContent = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        widget.title != null
            ? Container(
                padding: EdgeInsets.fromLTRB(50.w, 50.w, 50.w, 0),
                alignment: widget.titleAlign,
                child: Text(widget.title,
                    style: TextStyle(
                        fontSize: 30.sp,
                        color: widget.titleColor ?? Color(0xff323233),
                        fontWeight: FontWeight.w500)),
              )
            : Container(),
        Flexible(
          child: widget.child ??
              Container(
                padding: EdgeInsets.fromLTRB(
                    50.w, widget.title != null ? 25.w : 50.w, 50.w, 50.w),
                child: Text(widget.message,
                    textAlign: widget.messageAlign,
                    style: TextStyle(fontSize: 30.sp, color: widget.contentColor ?? Color(0xff646566))),
              ),
        ),
        (widget.showConfirmButton || widget.showCancelButton)
            ? SizedBox(height: 1, child: Container(color: widget.borderColor ?? Color(0xffebedf0)))
            : Container(),
        (widget.showConfirmButton || widget.showCancelButton)
            ? buildButtons()
            : Container()
      ],
    );

    return WillPopScope(
        child: GestureDetector(
          onTap: () => {widget.closeOnClickOverlay ? hideDialog() : null},
          child: Material(
            type: MaterialType.transparency,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 570.w),
                child: Container(
                  decoration: BoxDecoration(
                      color: widget.background ?? Colors.white,
                      borderRadius: BorderRadius.circular(20.w)),
                  child: _buildContent,
                ),
              ),
            ),
          ),
        ),
        onWillPop: () async {
          return widget.closeOnClickOverlay;
        });
  }
}
