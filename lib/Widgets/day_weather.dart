import 'package:flutter/material.dart';

class DayWeather extends StatelessWidget {
  const DayWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    final bool portt = orientation == Orientation.portrait ? true : false;

    return Stack(
      children: [
        Positioned(
          child: Image.asset('assets/icons/sun.png', width: 100),
          top: portt ? size.height * 0.06 : size.width * 0.06,
          left: portt ? size.height * 0.23 : size.width * 0.48,
        ),
        Positioned(
          child: Image.asset('assets/icons/cloud-day-l.png', width: 160),
          top: portt ? size.height * 0.1 : size.width * 0.1,
          left: portt ? size.width * 0.23 : size.width * 0.38,
        ),
      ],
    );
  }
}
