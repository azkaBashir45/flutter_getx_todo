import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:getx_todo/screens/TodoScreen.dart';
import 'package:getxtodoapp/screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}
