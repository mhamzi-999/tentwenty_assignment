import 'package:flutter/material.dart';
import 'package:tentwenty/helpers/constants.dart';

class ShowsList extends StatefulWidget {
  const ShowsList({Key? key}) : super(key: key);

  @override
  State<ShowsList> createState() => _ShowsListState();
}

class _ShowsListState extends State<ShowsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              image: AssetImage("assets/images/watch1.png"),
              fit: BoxFit.cover
          )
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20,),
        child: Text("Free guy",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: CONSTANTS.colorFromHex("FFFFFF"),
            fontSize: 18,
            fontWeight: FontWeight.w500
        ),),
      ),
    );
  }
}
