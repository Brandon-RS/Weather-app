import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Services/weather_service.dart';
import 'package:weather_app/routes/routes.dart';
import 'package:weather_app/theme/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherService()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.system,
        theme: CustomTheme.ligthTheme,
        darkTheme: CustomTheme.darkTheme,
        routes: getAplicationRoutes(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
