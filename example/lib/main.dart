import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qz_ui_kit/src/helper/city_picker.dart';
void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      allowFontScaling: false,
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: ExamplePage()),
    );
  }
}

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('example'),
      ),
      body: RaisedButton(
        onPressed: () async {
          // pickerImage(context);
          cityPicker(context);
        },
        child: Text('picker image'),
      ),
      // body: AppScrollView(
      //   children: [
      //     RaisedButton(
      //       onPressed: () async {
      //         // String result = await ActionSheet(
      //         //   actions: [],
      //         //   cancelText: "取消",
      //         //   roundRadius: 10,
      //         // ).show(context);
      //       },
      //       child: Text('action sheet'),
      //     ),
      //     20.w.vb,
      //     RaisedButton(
      //       onPressed: () async {
      //         pickerImage(context);
      //       },
      //       child: Text('picker image'),
      //     )
      //   ],
      // ),
    );
  }
}
