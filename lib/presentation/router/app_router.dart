// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:taskk/presentation/screens/description.dart';
import 'package:taskk/presentation/screens/home.dart';
import 'package:taskk/presentation/screens/news_details.dart';

import '../../logic/models/news.dart';
import '../screens/bottomnav.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BottomNavigation(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => Home(
            title: "Home Screen",
            color: Colors.blueAccent,
          ),
        );
      case '/Description':
        return MaterialPageRoute(
          builder: (_) => Description(),
        );
      case '/NewsDetails':
        return MaterialPageRoute(
          builder: (_) => NewsDetails(
            news: args as News,
            idx: args as int,
          ),
        );
      default:
        return null;
    }
  }
}
