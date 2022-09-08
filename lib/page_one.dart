import 'dart:isolate';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xoso77/dropdown_button.dart';
import 'package:xoso77/loading_result.dart';
import 'package:xoso77/table_two.dart';

import 'table_one.dart';

class PageOne extends StatefulWidget {
  PageOne({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  int _speed = 0;
  _build2(String text, int speed, {bool isColor = true}) {
    return TableOne(
      list: [
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        LoadingResult(
          doubleSpeed: _speed,
          speed: speed,
          color: isColor ? Colors.black : Colors.red,
        ),
      ],
    );
  }

  _build3(String text, int speed1, int speed2) {
    return TableOne(
      color: Colors.grey.shade200,
      list: [
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        LoadingResult(
          doubleSpeed: _speed,
          speed: speed1,
        ),
        LoadingResult(
          doubleSpeed: _speed,
          speed: speed2,
        ),
      ],
    );
  }

  _build4(String text, int speed1, int speed2, int speed3) {
    return TableOne(
      color: Colors.grey.shade200,
      list: [
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        LoadingResult(
          speed: speed1,
          doubleSpeed: _speed,
        ),
        LoadingResult(
          speed: speed2,
          doubleSpeed: _speed,
        ),
        LoadingResult(
          speed: speed3,
          doubleSpeed: _speed,
        ),
      ],
    );
  }

  _build5(String text, int speed1, int speed2, int speed3, int speed4,
      {bool isColor = true}) {
    return TableOne(
      color: Colors.amber.shade100,
      list: [
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        LoadingResult(
          speed: speed1,
          color: isColor ? Colors.black : Colors.red,
          doubleSpeed: _speed,
        ),
        LoadingResult(
          speed: speed2,
          color: isColor ? Colors.black : Colors.red,
          doubleSpeed: _speed,
        ),
        LoadingResult(
          speed: speed3,
          color: isColor ? Colors.black : Colors.red,
          doubleSpeed: _speed,
        ),
        LoadingResult(
          speed: speed4,
          color: isColor ? Colors.black : Colors.red,
          doubleSpeed: _speed,
        ),
      ],
    );
  }

  _build7(String text, int speed1, int speed2, int speed3, int speed4,
      int speed5, int speed6) {
    return Row(
      children: [
        Container(
          height: 100,
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(width: 0.5, color: Colors.grey),
                  bottom: BorderSide(width: 0.5, color: Colors.grey),
                  left: BorderSide(width: 0.5, color: Colors.grey),
                  right: BorderSide(width: 0.5, color: Colors.grey))),
          width: 64,
          child: Center(
              child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        Expanded(
          child: Column(
            children: [
              TableTwo(
                list: [
                  LoadingResult(
                    speed: speed1,
                    doubleSpeed: _speed,
                  ),
                  LoadingResult(
                    speed: speed2,
                    doubleSpeed: _speed,
                  ),
                  LoadingResult(
                    speed: speed3,
                    doubleSpeed: _speed,
                  ),
                ],
              ),
              TableTwo(
                list: [
                  LoadingResult(
                    speed: speed4,
                    doubleSpeed: _speed,
                  ),
                  LoadingResult(
                    speed: speed5,
                    doubleSpeed: _speed,
                  ),
                  LoadingResult(
                    speed: speed6,
                    doubleSpeed: _speed,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          DropdownButtonWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () {
                    setState(() {
                      _speed = 5000;
                    });
                  },
                  child: Text(
                    "Bắt đầu quay",
                    style: TextStyle(color: Colors.white),
                  )),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _speed = 0;
                    });
                  },
                  child: Text("Quay nhanh")),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          _build2("ĐB", 5800, isColor: false),
          _build2("Giải 1	", 700),
          _build3("Giải 2	", 900, 1100),
          _build7("Giải 3	", 1300, 1500, 1600, 1800, 2000, 2200),
          _build5("Giải 4	", 2400, 2600, 2800, 3000),
          _build7("Giải 5	", 3200, 3400, 3600, 3800, 4000, 4200),
          _build4(
            "Giải 6	",
            4400,
            4600,
            4800,
          ),
          _build5("Giải 7	", 5000, 5200, 5400, 5600, isColor: false),
        ],
      ),
    );
  }
}
