import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tentwenty/helpers/constants.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Top results",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: CONSTANTS.colorFromHex("202C43"),
                fontSize: 12,
                fontWeight: FontWeight.w500
            ),),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: CONSTANTS.colorFromHex("000000").withOpacity(0.5),
            //thickness: 1,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
                itemCount: 31,
                itemBuilder: (context,index)=>topList()),
          )

        ],
      ),
    );
  }
  Widget topList(){
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image:   const DecorationImage(
                    image:
                    AssetImage("assets/images/watch1.png"),
                    fit: BoxFit.fill
                )
            ),
          ),
          const SizedBox(width: 21,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Timless",
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                      color: CONSTANTS.colorFromHex("202C43"),
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),),
                const SizedBox(height:8,),
                Text("Fantasy",
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: CONSTANTS.colorFromHex("DBDBDF"),
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                  ),),
              ],
            ),
          ),
          const SizedBox(width: 21,),
          SvgPicture.asset("assets/icons/search_group.svg",height: 4,width: 20,)
        ],
      ),
    );
  }
}
