import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/constants.dart';

class CustomBottomNavigation extends StatefulWidget {
  final int index;
  const CustomBottomNavigation({Key? key, required this.index}) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int currentIndex=0;
  @override
  void initState() {
    // TODO: implement initState
    currentIndex=widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
          color: CONSTANTS.colorFromHex("#2E2739"),
          borderRadius: BorderRadius.circular(27)
      ),
      child: Row(

        children: [
          InkWell(
              onTap: (){
              }, child: bottomItem(0,"Dashboard","dashboard")),


          InkWell(
              onTap: () async {
              },
              child: bottomItem(1,"Watch","watch")),


          InkWell(
              onTap: (){
              },
              child: bottomItem(2,"Media Library","media")),
          InkWell(
              onTap: (){
              },
              child: bottomItem(3,"More","more")),
        ],
      ),
    );
  }
  Widget bottomItem(int index,String title, String iconName){
    return Container(
      width:MediaQuery.of(context).size.width/4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            //margin: EdgeInsets.only(top: 13.33),
            child: SvgPicture.asset("assets/icons/$iconName.svg",
              color:currentIndex==index?
              CONSTANTS.colorFromHex("#FFFFFF")
                  :CONSTANTS.colorFromHex("#827D88"),),
          ),
          Container(
            margin: const EdgeInsets.only(top:8),
            child: Text(title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color:currentIndex==index?
                  CONSTANTS.colorFromHex("#FFFFFF")
                      :CONSTANTS.colorFromHex("#827D88"),
                  fontSize: 10,
                  fontWeight:currentIndex==index? FontWeight.w700:FontWeight.w400,
              ),),
          )
        ],
      ),
    );
  }
}
