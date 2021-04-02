import 'package:flutter/material.dart';

import '../../presentation/journey/common/common.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() => {
        ...CommonRoutes.all(),
      };
}
