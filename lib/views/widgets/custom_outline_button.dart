
import 'package:flutter/material.dart';

import '../../helpers/constants.dart';
class CustomOutlineButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final double height;
  final IconData iconData;
  const CustomOutlineButton({Key? key, required this.text, required this.onPressed, required this.height, required this.iconData}) : super(key: key);

  @override
  _CustomOutlineButtonState createState() => _CustomOutlineButtonState();
}

class _CustomOutlineButtonState extends State<CustomOutlineButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      child: OutlinedButton(onPressed: ()=>widget.onPressed(),
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 1.0,
            color: CONSTANTS.colorFromHex("#61C3F2"),
            style: BorderStyle.solid,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.iconData,color: CONSTANTS.colorFromHex("FFFFFF"),size: 17,),
            const SizedBox(width: 8,),
            Text(widget.text,
                style: TextStyle(
                    color: CONSTANTS.colorFromHex("#FFFFFF"),
                    fontWeight: FontWeight.w500,
                    fontSize: 14
                )
            ),
          ],
        ),
      ),
    );
  }
}
