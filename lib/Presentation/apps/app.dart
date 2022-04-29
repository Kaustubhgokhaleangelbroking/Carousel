import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/apps/routes.dart';
import '../../presentation/apps/routes_constant.dart';
// import '../journey/home/home.dart';
// import '../journey/favourite/favourite.dart';
// import '../../presentation/journey/home/list_bloc/list_bloc.dart';

class MyApps extends StatelessWidget {
  MaterialApp build(BuildContext context) => MaterialApp(
        title: 'Tinder Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: Routes.getAll(),
        initialRoute: RouteConstants.home,
      );
  // final ListBloc listBloc = ListBloc();

  // void dispose() {
  //   listBloc.close();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   SystemChrome.setEnabledSystemUIOverlays([]);

  //   return BlocProvider(
  //     create: (context) => ListBloc(),
  //     child: MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       initialRoute: '/',
  //       routes: {
  //         '/': (context) => Home(),
  //         '/favourite': (context) => Favourite(),
  //       },
  //       // home: Home(),
  //     ),
  //   );
  // }
}
