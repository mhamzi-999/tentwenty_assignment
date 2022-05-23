
import 'package:flutter/material.dart';

import '../../helpers/constants.dart';
class CustomButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final double height;
  const CustomButton({Key? key, required this.text, required this.onPressed, required this.height}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      child: ElevatedButton(onPressed: ()=>widget.onPressed(),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          primary: CONSTANTS.colorFromHex("#61C3F2")),
        child: Text(widget.text,
          style:TextStyle(
            color: CONSTANTS.colorFromHex("#FFFFFF"),
            fontSize: 14,
            letterSpacing: 0.2
            )
        ),
      ),
    );
  }
}
