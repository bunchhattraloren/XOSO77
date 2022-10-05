import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Miền Bắc',
  'Tây Ninh',
  'Bến Tre',
  'Vũng Tàu',
  'Vĩnh Long',
  'TP Hồ Chí Minh',
  'An Giang',
  'Long An',
  'Đồng Nai',
  'Tiền Giang',
  'Cần Thơ',
  'Đồng Tháp',
  'Bình Phước',
  'Cà Mau',
  'Kiên Giang',
  'Hậu Giang',
  'Sóc Trăng',
  'Bình Thuận',
  'Đà Lạt',
  'Bình Dương',
  'Trà Vinh',
  'Bạc Liêu',
  'Bình Định',
  'Đà Nẵng',
  'Đắc Lắc',
  'Quảng Ngãi',
  'Gia Lai',
  'Khánh Hòa',
  'Kon Tum',
  'Ninh Thuận',
  'Thừa Thiên Huế',
  'Quảng Trị',
  'Đắc Nông',
  'Quảng Nam',
  'Quảng Bình',
  'Phú Yên',
  'Hà Nội',
  'Quảng Ninh',
  'Bắc Ninh',
  'Hải Phòng',
  'Nam Định',
  'Thái Bình'
];

class DropdownButtonWidget extends StatefulWidget {
  const DropdownButtonWidget({super.key});

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: dropdownValue,
      // icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      // style: const TextStyle(color: Colors.deepPurple),
      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      // ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: Colors.green),
          ),
        );
      }).toList(),
    );
  }
}
