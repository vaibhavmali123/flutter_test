import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application/Ui/MoviesList.dart';

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner:false,
      home:Scaffold(
        body:MoviesList(),
      ),
    );
  }
}