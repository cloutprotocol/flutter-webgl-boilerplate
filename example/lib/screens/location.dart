import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);
  static const String routeName = '/location';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => LocationScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocationScreenView(),
    );
  }
}

class LocationScreenView extends StatefulWidget {
  const LocationScreenView({Key? key}) : super(key: key);

  @override
  _LocationScreenViewState createState() => _LocationScreenViewState();
}

class _LocationScreenViewState extends State<LocationScreenView> {
  // initialize webview controller
  // late WebViewPlusController controller;
  double _height = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return ListView(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: GoogleMap(
                  myLocationButtonEnabled: true,
                  initialCameraPosition:
                      CameraPosition(target: LatLng(10, 10), zoom: 10),
                )),
            // Text("Height: $_height",
            //     style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
            // SizedBox(
            //   // height size of screen
            //   height: constraints.maxHeight * 1.1,
            //   child: WebViewPlus(
            //     backgroundColor: Colors.transparent,
            //     initialUrl: 'assets/touch/index.html',
            //     onWebViewCreated: (controller) {
            //       this.controller = controller;
            //     },
            //     // onPageFinished: (url) {
            //     //   controller?.getHeight().then((double height) {
            //     //     debugPrint("Height: " + height.toString());
            //     //     setState(() {
            //     //       _height = height;
            //     //     });
            //     //   });
            //     // },
            //     javascriptChannels: {
            //       JavascriptChannel(
            //         name: 'JavascriptChannel',
            //         onMessageReceived: (message) async {
            //           print('Javascript: "${message.message}"');
            //           // recieve a response from javascript
            //           await showDialog(
            //             context: context,
            //             builder: (context) => AlertDialog(
            //               content: Text(message.message),
            //               actions: [
            //                 TextButton(
            //                   child: Text('OK'),
            //                   onPressed: () => Navigator.of(context).pop(),
            //                 ),
            //               ],
            //             ),
            //           );
            //           // return a response to javascript
            //           controller.webViewController.evaluateJavascript('ok()');
            //         },
            //       ),
            //     },
            //     javascriptMode: JavascriptMode.unrestricted,
            //   ),
            // ),
            // Container(
            //   height: constraints.maxHeight * .1,
            //   child: Row(
            //     children: <Widget>[
            //       //add button
            //       Expanded(
            //         child: GestureDetector(
            //           onTapDown: (TapDownDetails tapDownDetails) {
            //             controller.webViewController.evaluateJavascript('left()');
            //           },
            //           onTapCancel: () {
            //             controller.webViewController.evaluateJavascript('leftoff()');
            //           },
            //           child: RaisedButton(
            //             onPressed: () {},
            //             child: Text('left'),
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //         child: GestureDetector(
            //           // When the child is tapped, show a snackbar
            //           onTapDown: (TapDownDetails tapDownDetails) {
            //             controller.webViewController.evaluateJavascript('right()');
            //           },
            //           onTapCancel: () {
            //             controller.webViewController.evaluateJavascript('rightoff()');
            //           },
            //           child: RaisedButton(
            //             onPressed: () {},
            //             child: Text('Right'),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        );
      }),
    );
  }
}
