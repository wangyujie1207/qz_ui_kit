import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/qrcode_reader_view.dart';


class ScanPage extends StatefulWidget {
  ScanPage({Key key}) : super(key: key);

  @override
  _ScanPageState createState() => new _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  GlobalKey<QrcodeReaderViewState> _key = GlobalKey();
  int isOnce = 0;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: QrcodeReaderView(
        key: _key,
        onScan: onScan,
        headerWidget: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
      ),
    );
  }

  Future onScan(String data) async {
    if(data.isNotEmpty){
      setState(() {
        isOnce++;
      });
    }
    if(isOnce <= 1){
      Navigator.pop(context, data);
    }
    _key.currentState.startScan();

  }

  @override
  void dispose() {
    super.dispose();
  }
}
