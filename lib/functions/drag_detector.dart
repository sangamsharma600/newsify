import 'dart:math';

import 'package:flutter/material.dart';

import '../screens/homepage.dart';

horizontalDrag(BuildContext context) async {
  var randomDelay = Random();
  await Future.delayed(
    Duration(
      seconds: randomDelay.nextInt(4),
    ),
  );
  await Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const HomeScreen()));
}
