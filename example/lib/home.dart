import 'package:flutter/material.dart';
import 'package:qz_ui_kit/widgets/scroller_view.dart';

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('example'),),
      body: AppScrollView(
        children: [

        ],
      ),
    );
  }
}
