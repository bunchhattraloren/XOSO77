import 'dart:io';
import 'package:get/get.dart';

class WebService extends GetConnect {
  Future<dynamic> postResponse() async {
    String deviceType = Get.deviceLocale.toString();
    var body = {
      "index1": 4,
      "index2": 5,
    };
    final response = await post(
        "http://gmdapp-001-site1.ftempurl.com/572d4e421e5e6b9bc11d815e8a027112",
        body,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "lang": deviceType,
        });

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
      // return "200";
    }
  }
}
