import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kPrimaryColor = Color.fromARGB(255, 14, 20, 136);
DateTimeFormat() {
  DateTime _dateTime = DateTime.now();
  // DateTime.parse(dateTime);
  return DateFormat('dd-MM-yyyy').format(_dateTime); //dd/MMM/yyyy kk:mm a
}
