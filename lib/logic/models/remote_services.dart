import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:taskk/logic/cubit/cubit/location_cubit.dart';
import 'package:taskk/logic/models/news.dart';
import 'package:taskk/logic/models/weather.dart';

class WeatherService {
  final String lats;
  final String longs;
  WeatherService({required this.lats, required this.longs});
  Future<Weather> getWeather() async {
    var clinet = http.Client();
    var uri = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=c84e840c4ea94ad78ed73259230208&q=$lats,$longs&aqi=no");
    var response = await clinet.get(uri);
    if (response.statusCode == 200) {
      print(response.body);
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      return Weather.fromJson(jsonMap);
    } else {
      throw Exception("Failed to load weather");
    }
  }
}

class NewsService {
  Future<News> getNews() async {
    var clinet = http.Client();
    var uri = Uri.parse(
        "https://www.alphavantage.co/query?function=NEWS_SENTIMENT&&limit=70&&apikey=9JLF8AXK9XPFFDSC");
    var response = await clinet.get(uri);
    if (response.statusCode == 200) {
      print(response.body);
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      return News.fromJson(jsonMap);
    } else {
      throw Exception("Failed to load news");
    }
  }
}
