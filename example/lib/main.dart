import 'package:flutter/material.dart';
import 'package:webgl_flutter/screens/screens.dart';
import 'package:webgl_flutter/config/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter WebGL',
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}