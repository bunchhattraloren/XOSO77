import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TableOne extends StatelessWidget {
  const TableOne(
      {Key? key,
      required this.list,
      this.borderTop = true,
      this.color = Colors.white})
      : super(key: key);
  final List<Widget> list;
  final borderTop;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          list.length,
          (index) => index != 0
              ? Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: color,
                        border: borderTop
                            ? const Border(
                                top: BorderSide(width: 0.5, color: Colors.grey),
                                bottom:
                                    BorderSide(width: 0.5, color: Colors.grey),
                                left:
                                    BorderSide(width: 0.5, color: Colors.grey),
                                right:
                                    BorderSide(width: 0.5, color: Colors.grey))
                            : const Border()),
                    child: Center(child: list[index]),
                  ),
                )
              : Container(
                  width: 64,
                  height: 50,
                  decoration: BoxDecoration(
                      color: color,
                      border: borderTop
                          ? const Border(
                              top: BorderSide(width: 0.5, color: Colors.grey),
                              bottom:
                                  BorderSide(width: 0.5, color: Colors.grey),
                              left: BorderSide(width: 0.5, color: Colors.grey),
                              right: BorderSide(width: 0.5, color: Colors.grey))
                          : const Border()),
                  child: Center(child: list[index]),
                )),
    );
  }
}
