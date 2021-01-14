import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

Future<Uint8List> captureWidget(GlobalKey globalKey, [double pixelRatio = 1]) async {
  RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
  ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);
  ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  Uint8List pngBytes = byteData.buffer.asUint8List();
  return pngBytes;
}

