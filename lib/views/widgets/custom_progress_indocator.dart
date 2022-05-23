import 'package:flutter/material.dart';
import 'package:tentwenty/helpers/constants.dart';

Widget customProgressIndicator(){
  return Center(
    child: CircularProgressIndicator(
        backgroundColor: Colors.transparent,
        valueColor: AlwaysStoppedAnimation<Color>(CONSTANTS.colorFromHex("15D2BC"))
    ),
  );
}