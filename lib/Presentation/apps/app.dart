import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../journey/home/home.dart';

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        
        home: Home());
  }
}
