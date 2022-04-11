import 'package:bloc_test/views/add_money.dart';
import 'package:bloc_test/bottom_nav.dart';
import 'package:flutter/material.dart';

class AppRouter {

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const BottomNav());
      case '/addMoney':
        return MaterialPageRoute(builder: (_) => const AddMoney());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))));
    }
  }
}
