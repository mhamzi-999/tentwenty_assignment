
import 'package:flutter/cupertino.dart';

import '../../helpers/constants.dart';

Widget noRecordWidget(String test){
  return Center(
    child: Text(test,style:  TextStyle(
      color: CONSTANTS.colorFromHex("#15D2BC"),
      fontWeight: FontWeight.w500,
      fontSize: 15
    ),),
  );
}