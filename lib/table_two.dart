import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TableTwo extends StatelessWidget {
  const TableTwo({Key? key, required this.list, this.borderTop = true})
      : super(key: key);
  final List<Widget> list;
  final borderTop;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
            list.length,
            (index) => Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
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
                )));
  }
}
