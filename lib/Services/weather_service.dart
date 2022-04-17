import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:weather_app/providers/weather_provider.dart';

class WeatherService extends ChangeNotifier {
  final String _baseUrl = 'api.openweathermap.org';
  final String _apiKey = 'c6f8******************************32e8';

  WeatherProvider? data;
  bool _searchItem = false;
  bool isLoading = false;

  WeatherService() {
    getWeatherData();
  }

  bool get searchItem => _searchItem;

  set searchItem(bool value) {
    _searchItem = value;
    notifyListeners();
  }

  Future<void> getWeatherData({String? place}) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'data/2.5/weather', {
      'appid': _apiKey,
      'units': 'metric',
      'q': place ?? 'London',
    });

    final resp = await http.get(url);
    final wthResp = WeatherProvider.fromJson(resp.body);

    data = wthResp;

    isLoading = false;
    notifyListeners();
  }
}
