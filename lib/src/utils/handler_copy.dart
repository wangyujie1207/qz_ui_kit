import 'package:flutter/services.dart';
import 'package:qz_ui_kit/src/utils/toast.dart';

void handlerCopy(String text) {
  if (text == null) return;
  Clipboard.setData(ClipboardData(text: text));
  showToast('复制成功');
}