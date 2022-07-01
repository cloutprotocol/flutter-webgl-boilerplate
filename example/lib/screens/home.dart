import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  static const String routeName = '/';

  static Route route(){
    return MaterialPageRoute(
      builder: (_) => HomeScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
    child: ElevatedButton(
        child: Text('tron demo'),
        onPressed: (){
          Navigator.pushNamed(context, '/tron');
        },
      ),
      ),
    );
  }
}