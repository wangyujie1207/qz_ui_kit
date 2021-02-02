import 'package:flutter/material.dart';

import 'divider.dart';

class ActionSheet {
  // 菜单选项
  final List<ActionSheetItem> actions;

  // 顶部标题
  final String title;

  // 取消按钮文字
  final String cancelText;

  // 选项上方的描述信息
  final String description;

  // 是否显示圆角
  final bool round;

  // 圆角弧度
  final double roundRadius;

  // 关闭图标
  final IconData closeIcon;

  // 是否在点击遮罩层后关闭
  final bool closeOnClickOverlay;

  // 选中选项时触发，禁用或加载状态下不会触发
  final Function(
          ActionSheetItem actionSheetItem, int index, BuildContext context)
      onSelect;

  // 取消按钮点击时触发
  final Function() onCancel;

  // 关闭菜单时触发
  final Function() onClose;

  // 自定义菜单内容
  final Widget child;

  // 背景色
  final Color background;

  final Color lineColor;

  final Color spacerColor;

  final Color cancelColor;

  const ActionSheet({
    Key key,
    this.actions,
    this.title,
    this.cancelText,
    this.description,
    this.round: true,
    this.roundRadius: 0.0,
    this.closeIcon,
    this.closeOnClickOverlay: true,
    this.onSelect,
    this.onCancel,
    this.onClose,
    this.child,
    this.background: Colors.white,
    this.lineColor,
    this.spacerColor,
    this.cancelColor,
  });

  show(BuildContext context) {
    return showModalBottomSheet<String>(
        context: context,
        backgroundColor: background,
        isDismissible: closeOnClickOverlay,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(roundRadius))),
        builder: (BuildContext context) {
          return ActionSheetState(this);
        });
  }
}

class ActionSheetState extends StatelessWidget {
  final ActionSheet actionSheet;

  const ActionSheetState(this.actionSheet);

  List<Widget> buildActionSheetItemContent(ActionSheetItem action) {
    return [
      action.loading
          ? SizedBox(
              width: 16.0,
              height: 16.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(0xff323233)),
                backgroundColor: Colors.white,
                strokeWidth: 1,
              ),
            )
          : Container(),
      Text(action.name ?? "",
          style: TextStyle(
              fontSize: 16,
              color: action.disabled
                  ? Color(0xffc8c9cc)
                  : action.color ?? Color(0xff323233))),
      SizedBox(width: action.subname != null ? 4 : 0),
      Text(action.subname ?? "",
          style: TextStyle(fontSize: 12, color: Color(0xff646566)))
    ];
  }

  buildActionSheetItem(BuildContext context, List<ActionSheetItem> actions) {
    List<Widget> widgets = [];
    if (actionSheet.child != null) return [actionSheet.child];
    for (int i = 0; i < actions.length; i++) {
      ActionSheetItem action = actions[i];
      widgets.add(Column(
        children: <Widget>[
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              focusColor: (action.disabled || action.loading)
                  ? Colors.transparent
                  : Theme.of(context).focusColor,
              highlightColor: (action.disabled || action.loading)
                  ? Colors.transparent
                  : Theme.of(context).highlightColor,
              hoverColor: (action.disabled || action.loading)
                  ? Colors.transparent
                  : Theme.of(context).hoverColor,
              splashColor: (action.disabled || action.loading)
                  ? Colors.transparent
                  : Theme.of(context).splashColor,
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildActionSheetItemContent(action),
                ),
              ),
              onTap: () {
                if (action.loading || action.disabled) return;
                if (actionSheet.onSelect != null)
                  actionSheet.onSelect(action, i, context);
                close(context, action.value);
              },
            ),
          ),
          i < actions.length
              ? NDivider(hairline: true, lineColor: actionSheet.lineColor)
              : Container()
        ],
      ));
    }
    return widgets;
  }

  Widget buildTitleItem(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              alignment: AlignmentDirectional.center,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: <Widget>[
                  actionSheet.title != null
                      ? Text(actionSheet.title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))
                      : Container(),
                  SizedBox(height: 4),
                  actionSheet.description != null
                      ? Text(actionSheet.description,
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff646566)))
                      : Container(),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: GestureDetector(
                  onTap: () {
                    close(context);
                  },
                  child: Icon(actionSheet.closeIcon,
                      color: Color(0xff969799), size: 18),
                ),
              ),
            )
          ],
        ),
        NDivider()
      ],
    );
  }

  Widget buildCancelItem(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            height: 8, color: actionSheet.spacerColor ?? Color(0xfff7f8fa)),
        DecoratedBox(
          decoration: BoxDecoration(
//            color: Colors.white,
              ),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              child: Container(
                alignment: AlignmentDirectional.center,
                height: 50,
                child: Text(actionSheet.cancelText,
                    style: TextStyle(
                        fontSize: 16,
                        color: actionSheet.cancelColor ?? Color(0xff323233))),
              ),
              onTap: () {
                if (actionSheet.onCancel != null) actionSheet.onCancel();
                close(context);
              },
            ),
          ),
        ),
        NDivider(hairline: true)
      ],
    );
  }

  void close(BuildContext context, [String value]) {
    if (actionSheet.onClose != null) actionSheet.onClose();
    Navigator.of(context).pop(value);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(actionSheet.roundRadius),
      ),
      child: Container(
//        decoration: BoxDecoration(
//          color: Colors.white,
//            borderRadius: BorderRadius.vertical(
//                top: Radius.circular(actionSheet.round ? 20 : 0)),
//            ),
          child: SafeArea(
              child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          (actionSheet.title != null || actionSheet.description != null)
              ? buildTitleItem(context)
              : Container(),
          ...buildActionSheetItem(context, actionSheet.actions),
          (actionSheet.cancelText != null)
              ? buildCancelItem(context)
              : Container()
        ],
      ))),
    );
  }
}

class ActionSheetItem {
  // 标题
  final String name;

  // 二级标题
  final String subname;

  // 选项文字颜色
  final Color color;

  // 是否为加载状态
  final bool loading;

  // 是否为禁用状态
  final bool disabled;

  // 选项值
  final String value;

  ActionSheetItem(
      {this.name,
      this.subname,
      this.color: Colors.black,
      this.loading: false,
      this.disabled: false,
      this.value});
}
