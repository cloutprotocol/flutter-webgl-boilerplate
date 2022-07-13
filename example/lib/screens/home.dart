import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FLUTTER + WEBGL',
          style: Theme.of(context)
              .textTheme
              .headline1
        // ?.copyWith(color: Colors.white)
      ),
      backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:60),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                child: Text('tron demo',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        // ?.copyWith(color: Colors.white)
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/tron');
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                child: Text('Mobile Touch',
                style: Theme.of(context)
                      .textTheme
                      .headline3
                      // ?.copyWith(color: Colors.white)
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/mobiletouch');
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                child: Text('heart demo',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        // ?.copyWith(color: Colors.white)
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/heart');
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                child: Text('Decision Maker [PWA]',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                  // ?.copyWith(color: Colors.white)
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/decision-maker');
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                child: Text('PWA Base',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                  // ?.copyWith(color: Colors.white)
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/pwa');
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                child: Text('AnimeJs',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                  // ?.copyWith(color: Colors.white)
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/animejs');
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                child: Text('Location',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                  // ?.copyWith(color: Colors.white)
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                child: Text('astro',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                  // ?.copyWith(color: Colors.white)
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/astro');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
