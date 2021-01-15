import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../qz_ui_kit.dart';



Future<File> pickerImage(BuildContext context) async {
  final ImagePicker _picker = ImagePicker();

  final List<ActionSheetItem> actionList = [
    ActionSheetItem(name: "相机", value: "camera"),
    ActionSheetItem(name: "相册", value: "gallery"),
  ];

  String res =
  await ActionSheet(actions: actionList, cancelText: "取消", roundRadius: 10.w)
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
