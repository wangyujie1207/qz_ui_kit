import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qz_ui_kit/qz_ui_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        appBar: AppBar(title: Text('example')),
        body: AppScrollView(
          children: [
            CustomOutlineButton(
              // child: Text('test'),
              title: 'outline',
              onPressed: (){},
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(const Color(0xff106636)),
              strokeWidth: 2.w,
            ),
            Wrap(
              spacing: 16.0,
              alignment: WrapAlignment.center,
              runSpacing: 16.0,
              children: <Widget>[
                AnimatedRotationBox(
                  child: GradientCircularProgressIndicator(
                    radius: 15.0,
                    colors: [Colors.red[300], Colors.orange, Colors.grey[50]],
                    value: .8,
                    backgroundColor: Colors.transparent,
                  ),
                ),
                AnimatedRotationBox(
                  child: GradientCircularProgressIndicator(
                    radius: 15.0,
                    colors: [Colors.red, Colors.red],
                    value: .7,
                    backgroundColor: Colors.transparent,
                  ),
                ),
                AnimatedRotationBox(
                  duration: Duration(milliseconds: 800),
                  child: GradientCircularProgressIndicator(
                    radius: 15.0,
                    colors: [Colors.blue, Colors.lightBlue[50]],
                    value: .8,
                    backgroundColor: Colors.transparent,
                    strokeCapRound: true,
                  ),
                ),
                // Icon
                AnimatedRotationBox(
                  duration: Duration(milliseconds: 800),
                  child: Icon(Icons.loop),
                ),
                AnimatedRotationBox(
                  duration: Duration(milliseconds: 800),
                  child: Icon(Icons.add),
                ),
                AnimatedRotationBox(
                  duration: Duration(milliseconds: 800),
                  child: Icon(Icons.refresh),
                ),
                AnimatedRotationBox(
                  child: GradientCircularProgressIndicator(
                    colors: [
                      Colors.red,
                      Colors.amber,
                      Colors.cyan,
                      Colors.green[200],
                      Colors.blue,
                      Colors.red
                    ],
                    radius: 60.0,
                    stokeWidth: 5.0,
                    strokeCapRound: true,
                    backgroundColor: Colors.transparent,
                    value: 1.0,
                  ),
                ),

              ],
            ),
          ],
        ));
  }
}
