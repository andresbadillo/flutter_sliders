import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sliders_demo/src/pages/slideshow_page.dart';
// import 'package:sliders_demo/src/labs/slideshow_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: SlideshowPage(),
    );
  }
}
