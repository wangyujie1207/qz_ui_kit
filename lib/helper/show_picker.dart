import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showPicker({
  @required BuildContext context,
  @required List pickerData,
  @required PickerConfirmCallback onConfirm,
  TextStyle textStyle,
  TextStyle selectedTextStyle,
  TextStyle cancelTextStyle,
  TextStyle confirmTextStyle,
  String cancelText,
  String confirmText,
  Color backgroundColor,
  Decoration headerDecoration,
  Widget title,
}) {
  Picker picker = Picker(
    adapter: PickerDataAdapter<String>(pickerdata: pickerData),
    height: 480.w,
    changeToFirst: false,
    itemExtent: 80.w,
    backgroundColor: backgroundColor,
    title: title,
    textStyle:
        textStyle ?? TextStyle(color: const Color(0xff999999), fontSize: 34.sp),
    selectedTextStyle:
        selectedTextStyle ?? TextStyle(color: Colors.black, fontSize: 34.sp),
    cancelTextStyle: cancelTextStyle ??
        TextStyle(fontSize: 34.sp, color: const Color(0xff999999)),
    confirmTextStyle: confirmTextStyle ??
        TextStyle(fontSize: 34.sp, color: Theme.of(context).primaryColor),
    cancelText: cancelText ?? '取消',
    confirmText: confirmText ?? '确定',
    headerDecoration: headerDecoration,
    onConfirm: onConfirm,
  );
  picker.showModal(context);
}

showPickerDateMonth({
  @required BuildContext context,
  @required PickerConfirmCallback onConfirm,
  int type,
  TextStyle selectedTextStyle,
  TextStyle textStyle,
  TextStyle cancelTextStyle,
  TextStyle confirmTextStyle,
  String cancelText,
  String confirmText,
  Color backgroundColor,
  Widget title,
}) {
  Picker picker = Picker(
    adapter: new DateTimePickerAdapter(
        type: type ?? PickerDateTimeType.kYMD,
        isNumberMonth: true,
        yearSuffix: '年',
        monthSuffix: '月',
        daySuffix: '日'),
    height: 480.w,
    title: title,
    textAlign: TextAlign.right,
    selectedTextStyle:
        selectedTextStyle ?? TextStyle(color: Colors.black, fontSize: 34.sp),
    itemExtent: 80.w,
    textStyle:
        textStyle ?? TextStyle(color: const Color(0xff999999), fontSize: 34.sp),
    cancelTextStyle: cancelTextStyle ??
        TextStyle(fontSize: 34.sp, color: const Color(0xff999999)),
    confirmTextStyle: confirmTextStyle ??
        TextStyle(fontSize: 34.sp, color: const Color(0xff106636)),
    cancelText: cancelText ?? '取消',
    confirmText: confirmText ?? '确定',
    onConfirm: onConfirm,
    backgroundColor: backgroundColor,
  );
  picker.showModal(context);
}
