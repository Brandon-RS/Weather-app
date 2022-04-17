import 'package:flutter/material.dart';

class NightWeather extends StatelessWidget {
  const NightWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    final br = MediaQuery.of(context).platformBrightness;
    const ligth = Brightness.light;
    final bool portt = orientation == Orientation.portrait ? true : false;

    return Stack(
      children: [
        Positioned(
          child: Image.asset(
            br == ligth ? img('cloud-day-l.png') : img('cloud-night-d.png'),
            width: 160,
          ),
          top: portt ? size.height * 0.1 : size.width * 0.1,
          left: portt ? size.width * 0.08 : size.width * 0.28,
        ),
        Positioned(
          child: Image.asset(
            br == ligth ? img('moon-d.png') : img('moon.png'),
            width: 100,
          ),
          top: portt ? size.height * 0.06 : size.width * 0.06,
          left: portt ? size.height * 0.17 : size.width * 0.41,
        ),
        Positioned(
          child: Image.asset(
            br == ligth ? img('cloud-day-l.png') : img('cloud-night-d.png'),
            width: 100,
          ),
          top: portt ? size.height * 0.06 : size.width * 0.06,
          left: portt ? size.height * 0.3 : size.width * 0.56,
        ),
      ],
    );
  }

  String img(String name) {
    return 'assets/icons/$name';
  }
}
