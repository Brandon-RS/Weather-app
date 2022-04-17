import 'package:flutter/material.dart';
import 'package:weather_app/pages/pages.dart';

Map<String, WidgetBuilder> getAplicationRoutes() => <String, WidgetBuilder>{
      '/': (BuildContext context) => const HomePage(),
    };