import 'package:flutter/services.dart';

import '../qz_ui_kit.dart';

void handlerCopy(String text, {String successText:"复制成功"}) {
  if (text == null) return;
  Clipboard.setData(ClipboardData(text: text));
  showToast(successText);
}