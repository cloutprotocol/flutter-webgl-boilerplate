# flutter webgl
## three.js + WebViewPlus +  webViewController

## Getting Started
This project is a starting point for a Flutter application using WebViewPlus to render a local three.js scene while sending and recieving javascript responses via controller.webViewController.evaluateJavascript event.

## credits
### base project
webview_flutter_plus_example by @shah-xad
https://github.com/shah-xad/webview_flutter_plus/tree/master/example

### three.js scene
WebGL Test by @russellbeattie  
https://codepen.io/russellbeattie/pen/kGxaqM

# Execution

#### WebViewPlus with Javascript Listener
```dart
            child: WebViewPlus(
initialUrl: 'assets/tron/index.html',
onWebViewCreated: (controller) {
this.controller = controller;
},
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
```

#### Javascript postMessage 
```dart
/* Flutter Javascript Channel: AlertDialogue */
JavascriptChannel.postMessage("Hello, this message is posted from from assets/tron/script.js");
```

#### Gesture Detector with javascript passthrough
```javascript
GestureDetector(
onTapDown: (TapDownDetails tapDownDetails) {
controller.webViewController.evaluateJavascript('left()');
},
onTapCancel: () {
controller.webViewController
    .evaluateJavascript('leftoff()');
},
child: RaisedButton(
onPressed: () {},
child: Text('left'),
),
),
```

### shrinkWrap webview and NeverScrollableScrollPhysics
```dart
return LayoutBuilder(
builder: (BuildContext context, BoxConstraints constraints) {
return ListView(
physics: const NeverScrollableScrollPhysics(),
shrinkWrap: true,
children: [],
);
},
);
```

### Remove Scrolling and highlighting css
```css
html,body {
  margin: 0px !important;
  padding: 0px !important;
  background:transparent;
  overflow: hidden;
   -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
   -webkit-tap-highlight-color: transparent;
   -webkit-user-select: none;
   -khtml-user-select: none;
   -moz-user-select: none;
   -ms-user-select: none;
    user-select: none;
}
```

### Completed Column ✓
- [x] Implement WebViewPlus with local three.js scene
- [x] fix bouncing WebView in flutter
- [x] improve highlighting of WebView on long press
- [x] flutter event to javascript function (controller)

### ToDo
- [ ] Touch Controls
    - [ ] refine touch events
    - [ ] test swiping events
    - [ ] test flutter slider to pass variable
    - [ ] create gamepad widget







