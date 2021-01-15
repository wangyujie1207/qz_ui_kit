import 'package:flutter/services.dart';

import '../qz_ui_kit.dart';

void handlerCopy(String text) {
  if (text == null) return;
  Clipboard.setData(ClipboardData(text: text));
  showToast('复制成功');
}