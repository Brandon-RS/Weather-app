import 'dart:convert';

class WeatherProvider {
  WeatherProvider({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  Map<String, dynamic> coord;
  List<WeatherElement> weather;
  String base;
  Map<String, dynamic> main;
  int visibility;
  Map<String, dynamic> wind;
  Map<String, dynamic> clouds;
  int dt;
  Map<String, dynamic> sys;
  int timezone;
  int id;
  String name;
  int cod;

  factory WeatherProvider.fromJson(String str) => WeatherProvider.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WeatherProvider.fromMap(Map<String, dynamic> json) => WeatherProvider(
        coord: json["coord"],
        weather: List<WeatherElement>.from(json["weather"].map((x) => WeatherElement.fromMap(x))),
        base: json["base"],
        main: json["main"],
        visibility: json["visibility"],
        wind: json["wind"],
        clouds: json["clouds"],
        dt: json["dt"],
        sys: json["sys"],
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
      );

  Map<String, dynamic> toMap() => {
        "coord": coord,
        "weather": List<dynamic>.from(weather.map((x) => x.toMap())),
        "base": base,
        "main": main,
        "visibility": visibility,
        "wind": wind,
        "clouds": clouds,
        "dt": dt,
        "sys": sys,
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
      };
}

class WeatherElement {
  WeatherElement({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  int id;
  String main;
  String description;
  String icon;

  factory WeatherElement.fromJson(String str) => WeatherElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WeatherElement.fromMap(Map<String, dynamic> json) => WeatherElement(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}
