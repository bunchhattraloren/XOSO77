import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:xoso77/homepage.dart';

import 'core/webservice.dart';

void main() {
  WebService().getResponse().then((value) {
    runApp(MyApp(
      status: value,
    ));
  });
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, this.status = "200"}) : super(key: key);
  String status;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return status == "200"
        ? const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: WebViewScreen(),
          )
        : MaterialApp(
            theme: ThemeData(primarySwatch: Colors.amber),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
  }
}

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Completer<WebViewController> _controller = Completer<WebViewController>();
    var deviceName;
    if (Platform.isAndroid) {
      //print('android');
      deviceName = 'http://api.gh765.com/lottery.php';
    } else if (Platform.isIOS) {
      //print('ios');
      deviceName = 'http://api.gh765.com/lottery.php';
    }
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: WebView(
          // javascriptMode: JavascriptMode.unrestricted,

          initialUrl: deviceName,
          gestureRecognizers: Set()
            ..add(Factory<VerticalDragGestureRecognizer>(
                () => VerticalDragGestureRecognizer())),
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    ));
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homepage();
  }

  void homepage() {
    Future.delayed(Duration(milliseconds: 500), () {
      // Get.offAllNamed(AppRoute.homepage);
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color.fromARGB(255, 14, 20, 136),
          child: Center(
              child: Image.asset(
            "assets/icon.png",
            width: 128,
          ))),
    );
  }
}
