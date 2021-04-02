import 'package:flutter/material.dart';

import '../../../presentation/apps/routes_constant.dart';
import '../../../presentation/journey/home/home.dart';
import '../../../presentation/journey/favourite/favourite.dart';

abstract class CommonRoutes {
  static Map<String, WidgetBuilder> all() => {
        RouteConstants.home: (context) => Home(),
        RouteConstants.favorite: (context) => Favourite(),
      };
}
