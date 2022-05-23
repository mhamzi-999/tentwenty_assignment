import 'package:flutter/material.dart';
import 'package:tentwenty/models/upcoming_detail_model/upcoming_detail_model.dart';

import '../../../helpers/constants.dart';

class GenresItem extends StatelessWidget {
  final int index;
  final Genre genre;
  const GenresItem({Key? key, required this.genre, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
      decoration: BoxDecoration(
        color:
        index%4==0?CONSTANTS.colorFromHex("15D2BC"):index%4==1?CONSTANTS.colorFromHex("E26CA5")
            :index%4==2?CONSTANTS.colorFromHex("564CA3"):
        CONSTANTS.colorFromHex("CD9D0F"),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Text(genre.name.toString(),
        textAlign: TextAlign.left,
        style: TextStyle(
            color: CONSTANTS.colorFromHex("FFFFFF"),
            fontSize: 12,
            fontWeight: FontWeight.w600
        ),),
    );
  }
}
