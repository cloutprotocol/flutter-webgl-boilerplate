import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class PwaBase extends StatelessWidget {
  const PwaBase({Key? key}) : super(key: key);
  static const String routeName = '/pwa';

  static Route route(){
    return MaterialPageRoute(
      builder: (_) => PwaBase(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PwaBaseView(),
    );
  }
}

class PwaBaseView extends StatefulWidget {
  const PwaBaseView({Key? key}) : super(key: key);

  @override
  _PwaBaseViewState createState() =>
      _PwaBaseViewState();
}

class _PwaBaseViewState
    extends State<PwaBaseView> {
  // initialize webview controller
  late WebViewPlusController controller;
  double _height = 1;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
    ),
     child: Scaffold(
       extendBody: true,
       backgroundColor: Colors.transparent,
    body: Container(
      height: 1200,
      decoration: BoxDecoration(color: Colors.black),
            child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return ListView(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: false,
              children: [
                // Text("Height: $_height",
                //     style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
                SizedBox(
                  // height size of screen
                  height: constraints.maxHeight * 1,
                  child: WebViewPlus(
                    backgroundColor: Colors.transparent,
                    initialUrl: 'assets/www/pwa/index.html',
                    onWebViewCreated: (controller) {
                      this.controller = controller;
                    },
                    // onPageFinished: (url) {
                    //   controller?.getHeight().then((double height) {
                    //     debugPrint("Height: " + height.toString());
                    //     setState(() {
                    //       _height = height;
                    //     });
                    //   });
                    // },
                    javascriptChannels: {
                      JavascriptChannel(
                        name: 'JavascriptChannel',
                        onMessageReceived: (message) async {
                          print('Javascript: "${message.message}"');
                          // recieve a response from javascript
                          await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Text(message.message),
                              actions: [
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ],
                            ),
                          );
                          // return a response to javascript
                          controller.webViewController.evaluateJavascript('ok()');
                        },
                      ),
                    },
                    javascriptMode: JavascriptMode.unrestricted,
                  ),
                ),
              ],
            );
          }),),),
    );
  }
}
