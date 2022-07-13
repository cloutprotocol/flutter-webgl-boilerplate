import 'package:flutter/material.dart';
import 'package:webgl_flutter/config/screens.dart';

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
      case HeartScreen.routeName:
        return HeartScreen.route();
      case MobileTouchScreen.routeName:
        return MobileTouchScreen.route();
      case PwaBase.routeName:
        return PwaBase.route();
      case DecisionMaker.routeName:
        return DecisionMaker.route();
      case AnimeJs.routeName:
        return AnimeJs.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      case AstroScreen.routeName:
        return AstroScreen.route();
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