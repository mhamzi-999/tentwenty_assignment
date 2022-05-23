import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helpers/constants.dart';

class CustomTextfield extends StatefulWidget {
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChng;

  const CustomTextfield({
    Key? key, this.suffixIcon, this.hint,this.controller,this.focusNode, this.prefixIcon, this.onChng
  }) : super(key: key);
  @override
  _CustomTextfieldState createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {



  @override
  Widget build(BuildContext context) {
    return  Container(
      child: TextFormField(
        onChanged: widget.onChng,
        focusNode: widget.focusNode,
        controller: widget.controller,
        cursorColor: CONSTANTS.colorFromHex("#33C6A2"),
        maxLines: 1,
        decoration: InputDecoration(
          //isDense: true,
          //contentPadding: EdgeInsets.all(24),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius:BorderRadius.circular(30.0) ,
            borderSide: BorderSide(color: CONSTANTS.colorFromHex("#33C6A2"),width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:BorderRadius.circular(30.0) ,
            borderSide: BorderSide(color: CONSTANTS.colorFromHex("#363636").withOpacity(0.15),),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius:BorderRadius.circular(30.0) ,
            borderSide: const BorderSide(color:Colors.red,width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius:BorderRadius.circular(30.0) ,
            borderSide: const BorderSide(color:Colors.red,width: 2),
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,

          hintText: widget.hint,
          fillColor: Colors.white,
          hintStyle: TextStyle(
              color: CONSTANTS.colorFromHex("#202C43").withOpacity(0.7),
              fontWeight: FontWeight.w400,
              fontSize: 14
          ),
        ),
        style:
        TextStyle(
            color: CONSTANTS.colorFromHex("#33C6A2"),
            fontWeight: FontWeight.w500,
            fontSize: 14
        ),

      ),
    );


  }
}