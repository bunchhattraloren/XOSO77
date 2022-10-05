import 'dart:async';
import 'dart:io';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:uuid/uuid.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:xoso77/constants.dart';
import 'package:xoso77/homepage.dart';

import 'core/webservice.dart';

void main() {
  WebService().postResponse().then((value) {
    runApp(MyApp(
      value: value,
    ));
  });
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, this.value}) : super(key: key);
  final value;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return value['status'] == 201
        ? MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.amber,
              textTheme: TextTheme(
                bodyText2: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            home: WebViewScreen(
              value: value,
            ),
          );
  }
}

class WebViewScreen extends StatefulWidget {
  WebViewScreen({Key? key, this.value}) : super(key: key);
  final value;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  bool _isLoading = true;
  late AppsflyerSdk _appsflyerSdk;
  late Map _deepLinkData = {};
  late Map _gcd = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final AppsFlyerOptions options = AppsFlyerOptions(
        afDevKey: "ZZYi3V83Y4yJDbmy4pfJw8",
        appId: "appId",
        showDebug: true,
        timeToWaitForATTUserAuthorization: 15);
    _appsflyerSdk = AppsflyerSdk(options);
    _appsflyerSdk.initSdk(
        registerConversionDataCallback: true,
        registerOnAppOpenAttributionCallback: true,
        registerOnDeepLinkingCallback: true);
    _appsflyerSdk.onAppOpenAttribution((res) {
      print("onAppOpenAttribution res: " + res.toString());
      setState(() {
        _deepLinkData = res;
      });
    });
    _appsflyerSdk.onInstallConversionData((res) {
      print("onInstallConversionData res: " + res.toString());
      setState(() {
        _gcd = res;
      });
    });
    _appsflyerSdk.onDeepLinking((DeepLinkResult dp) {
      switch (dp.status) {
        case Status.FOUND:
          print(dp.deepLink?.toString());
          print("deep link value: ${dp.deepLink?.deepLinkValue}");
          break;
        case Status.NOT_FOUND:
          print("deep link not found");
          break;
        case Status.ERROR:
          print("deep link error: ${dp.error}");
          break;
        case Status.PARSE_ERROR:
          print("deep link status parsing error");
          break;
      }
      print("onDeepLinking res: " + dp.toString());
      setState(() {
        _deepLinkData = dp.toJson();
      });
    });
  }

  Future<bool?> logEvent(String eventName, Map? eventValues) async {
    bool? result;
    try {
      print("$eventName  $eventValues");
      result = await _appsflyerSdk.logEvent(eventName, eventValues);
    } on Exception catch (e) {}
    print("Result logEvent: $result");
  }

  @override
  Widget build(BuildContext context) {
    Completer<WebViewController> _controller = Completer<WebViewController>();
    var deviceName;
    if (Platform.isAndroid) {
      deviceName = decryptBase64(widget.value['url1']);
    } else if (Platform.isIOS) {
      deviceName = decryptBase64(widget.value['url2']);
    }
    JavascriptChannel _alertJavascriptChannel(BuildContext context) {
      return JavascriptChannel(
          name: 'Toast',
          onMessageReceived: (JavascriptMessage message) {
            if (!message.message.contains("event_name")) {
              var data = message.message.split("###");
              logEvent("recharge", {
                "af_content_id": Uuid().v1(),
                "af_currency": data[1],
                "af_revenue": data[0]
              });
            } else {
              var data = message.message.split("###");
              var eventname = data[0];
              var eventNameValue = eventname.split("=");
              var key = data[1];
              var keyValue = key.split("=");
              var value = data[2];
              var valeValue = value.split("=");

              logEvent(eventNameValue[1], {
                "af_content_id": Uuid().v1(), //"id123",
                "af_currency": keyValue[1],
                "af_revenue": valeValue[1]
              });
            }
          });
    }

    return Scaffold(
        body: SafeArea(
      child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
          child: Stack(children: [
            WebView(
              // javascriptMode: JavascriptMode.unrestricted,

              initialUrl: deviceName,
              gestureRecognizers: Set()
                ..add(Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer())),
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (url) {
                setState(() {
                  _isLoading = false;
                });
              },
              onWebViewCreated: (WebViewController controller) {
                _controller.complete(controller);
              },
            ),
            _isLoading
                ? Center(
                    child: SpinKitCircle(
                      color: Colors.amber,
                    ),
                  )
                : Stack(),
          ])),
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
