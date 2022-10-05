import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kPrimaryColor = Color.fromARGB(255, 14, 20, 136);
DateTimeFormat() {
  DateTime _dateTime = DateTime.now();
  // DateTime.parse(dateTime);
  return DateFormat('dd-MM-yyyy').format(_dateTime); //dd/MMM/yyyy kk:mm a
}

decryptBase64(String text) {
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  // String encoded =
  //     stringToBase64.encode(credentials); // dXNlcm5hbWU6cGFzc3dvcmQ=
  return stringToBase64.decode(text); // username:password
}
