import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lcadp/api/api_session.dart';

class SafePage extends StatefulWidget {
  const SafePage({Key? key}) : super(key: key);

  @override
  State<SafePage> createState() => _SafePageState();
}

class _SafePageState extends State<SafePage> {
  final controller = SessionDeviceAux();
  var value = SessionDeviceAux().getAmmount();
  String codeValue = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Seus ativos: ${value}',
            style: TextStyle(color: Colors.white70, fontSize: 20),
          ),
          // CarouselSlider(
          //   options: CarouselOptions(height: 400.0),
          //   items: [controller.hackSessionAux()]
          //       .take(1)
          //       .map(
          //         (e) => Builder(
          //           builder: (BuildContext context) {
          //             return Container(
          //               width: MediaQuery.of(context).size.width,
          //               margin: EdgeInsets.symmetric(horizontal: 5.0),
          //               decoration: BoxDecoration(color: Colors.red),
          //               child: Image.memory(base64.decode(e.toString())),
          //             );
          //           },
          //         ),
          //       )
          //       .toList(),
          // ),
          // Image.memory(),
        ],
      ),
    );
  }
}
