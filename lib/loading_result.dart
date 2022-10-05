import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingResult extends StatefulWidget {
  LoadingResult(
      {Key? key,
      this.speed = 500,
      this.color = Colors.white,
      this.doubleSpeed = 0})
      : super(key: key);
  int speed;
  int doubleSpeed;
  final Color color;
  @override
  State<LoadingResult> createState() => _LoadingResultState();
}

class _LoadingResultState extends State<LoadingResult> {
  bool _isLoading = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant LoadingResult oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    setState(() {
      _isLoading = true;
    });
    _loading();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading();
  }

  _loading() {
    int speed = widget.speed + widget.doubleSpeed;

    Future.delayed(Duration(milliseconds: speed), () {
      if (this.mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? SpinKitCircle(
            color: Colors.amber,
          )
        : Text(
            (Random().nextInt(100000) + 100000).toString(),
            style: TextStyle(
              color: widget.color,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          );
  }
}
