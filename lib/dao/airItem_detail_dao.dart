import 'dart:io';

import '../utils/http_util.dart';
import '../model/Item.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';





class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          'assets/images/2.jpg',
          scale: 1.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
