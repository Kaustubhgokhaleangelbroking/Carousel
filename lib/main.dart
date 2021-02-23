import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './presentation/apps/app.dart';

// import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData.dark().copyWith(
        //   scaffoldBackgroundColor: Color(0xFF111111),
        // ),
        home: MyApps());
  }
}
