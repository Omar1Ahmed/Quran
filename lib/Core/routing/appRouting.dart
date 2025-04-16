import 'package:flutter/material.dart';

class AppRouts {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/homeScreen':
        return MaterialPageRoute(builder: (_) => const Placeholder());
      default:
        return null;
    }
  }
}
