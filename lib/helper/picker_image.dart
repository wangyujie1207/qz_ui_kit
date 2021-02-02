import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../qz_ui_kit.dart';

Future<File> pickerImage(BuildContext context, List<ActionSheetItem> actionList,
    {String cancel: '取消', Color cancelColor}) async {
  final ImagePicker _picker = ImagePicker();

  String res = await ActionSheet(
          actions: actionList,
          cancelText: cancel,
          roundRadius: 10.w,
          cancelColor: cancelColor)
      .show(context);
  switch (res) {
    case 'camera':
      var pickedFile = await _picker.getImage(
        source: ImageSource.camera,
        // maxWidth: 300,
        // maxHeight: 300,
      );
      return File(pickedFile.path);
    case 'gallery':
      var pickedFile = await _picker.getImage(
        source: ImageSource.gallery,
        // maxWidth: 300,
        // maxHeight: 300,
      );
      return File(pickedFile.path);
      break;
    default:
      return null;
  }
}
