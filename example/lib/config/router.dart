import 'package:flutter/material.dart';
import 'package:webgl_flutter/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings){
    print('The Route is: ${settings.name}');

    switch (settings.name){
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case TronScreen.routeName:
        return TronScreen.route();
        break;
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute(){
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: Text('error'))),
      settings: RouteSettings(name: '/error'),
    );
  }

}