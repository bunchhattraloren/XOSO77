import 'dart:io';
import 'package:get/get.dart';

class WebService extends GetConnect {
  Future<dynamic> getResponse() async {
    String deviceType = Get.deviceLocale.toString();
    print(deviceType);
    final response = await get("http://api.gh765.com/vn.php", headers: {
      "devicelang": deviceType,
    });

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body['success'];
      // return "200";
    }
  }
}
