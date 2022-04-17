import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Services/weather_service.dart';
import 'package:weather_app/Widgets/widgets.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;

    final getData = Provider.of<WeatherService>(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20) + EdgeInsets.only(top: padding.top),
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
          ),
        ),
        child: getData.isLoading ? const Center(child: CircularProgressIndicator()) : Content(getData: getData),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getData.searchItem = getData.searchItem ? false : true;
        },
        child: const Icon(Icons.search, color: Colors.white),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({Key? key, required this.getData}) : super(key: key);

  final WeatherService getData;

  @override
  Widget build(BuildContext context) {
    final data = getData.data;
    var now = DateTime.now();
    var formatter = DateFormat('EEEE, dd MMMM yyyy');
    String date = formatter.format(now);

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchSection(),
          const SizedBox(height: 40),
          Text(data!.name, style: Theme.of(context).textTheme.headline3),
          const SizedBox(height: 7),
          Text(date, style: Theme.of(context).textTheme.bodyText1),
          const SizedBox(height: 20),
          const WeatherImage(),
          const SizedBox(height: 30),
          Degrees(data: data),
          const SizedBox(height: 50),
          Description(data: data),
          const SizedBox(height: 180, child: Center(child: DaysList())),
        ],
      ),
    );
  }
}

class SearchSection extends StatefulWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).inputDecorationTheme.focusedBorder!.borderSide.color;

    final data = Provider.of<WeatherService>(context);

    return Visibility(
      visible: data.searchItem,
      child: TextField(
        autofocus: true,
        controller: controller,
        cursorColor: color,
        style: TextStyle(color: color),
        onEditingComplete: () async {
          data.searchItem = false;
          await data.getWeatherData(place: controller.text);
          var obj = data.data;
          if (obj!.cod == 200) {
            log('good');
          } else {
            log('Err can not show it');
          }
        },
      ),
    );
  }
}

class DaysList extends StatelessWidget {
  const DaysList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> daysList = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    List<int> degreesList = [21, 22, 23, 24, 25, 26, 27];

    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: daysList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Container(
        width: 92,
        margin: const EdgeInsets.symmetric(vertical: 30),
        padding: const EdgeInsets.all(10),
        child: Day(day: daysList[index], degrees: degreesList[index]),
      ),
    );
  }
}

class Day extends StatelessWidget {
  const Day({Key? key, required this.day, required this.degrees}) : super(key: key);

  final String day;
  final int degrees;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          day,
          style: TextStyle(
            color: Theme.of(context).textTheme.headline5!.color,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Icon(Icons.sunny, color: Color(0xFFB52B65)),
        ),
        Text('$degreesº', style: Theme.of(context).textTheme.headline5),
      ],
    );
  }
}

class Description extends StatelessWidget {
  const Description({Key? key, required this.data}) : super(key: key);

  final WeatherProvider data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DescriptionSection(value: '${data.wind['speed']} km/h', title: 'Wind'),
        DescriptionSection(value: '${data.main['humidity']}%', title: 'Humidity'),
        DescriptionSection(value: '${data.main['temp_max']}º', title: 'Maximun'),
      ],
    );
  }
}

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({Key? key, required this.value, required this.title}) : super(key: key);

  final String value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: Theme.of(context).textTheme.headline4),
        Text(title, style: Theme.of(context).textTheme.bodyText2),
      ],
    );
  }
}

class Degrees extends StatelessWidget {
  const Degrees({Key? key, required this.data}) : super(key: key);

  final WeatherProvider data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text('${data.main['temp']}', style: Theme.of(context).textTheme.headline2),
              ),
              Positioned(
                right: size.width * 0.23,
                top: 8,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Theme.of(context).textTheme.headline2!.color!, width: 2),
                  ),
                  width: 12,
                  height: 12,
                ),
              ),
            ],
          ),
          Text(
            data.weather[0].description.capitalize(),
            style: const TextStyle(color: Color(0xFFC42766), fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

class WeatherImage extends StatelessWidget {
  const WeatherImage({Key? key}) : super(key: key);

  bool getHour() => DateTime.now().hour > 6 && DateTime.now().hour < 18 ? true : false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    final bool portt = orientation == Orientation.portrait ? true : false;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12,
      ),
      height: portt ? size.height * 0.28 : size.width * 0.28,
      width: size.width,
      child: getHour() ? const DayWeather() : const NightWeather(),
    );
  }
}
