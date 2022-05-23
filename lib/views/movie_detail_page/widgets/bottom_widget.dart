import 'package:flutter/material.dart';

import '../../../controllers/upcomig_detail_controller/upcoming_detail_controller.dart';
import '../../../helpers/constants.dart';
import 'genres_item.dart';

class BottomWidget extends StatelessWidget {
  final UpcomingDetailController upcomingDetail;
  const BottomWidget({Key? key, required this.upcomingDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: 40, right: 40, bottom: 10, top: 27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Genres",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: CONSTANTS.colorFromHex("202C43"),
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),),
          const SizedBox(
            height: 14,
          ),
          SizedBox(
            height: 24,
            child: ListView.builder(
              itemCount: upcomingDetail.upcomingDetailResp.value.genres!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GenresItem(genre:upcomingDetail.upcomingDetailResp.value.genres![index],index: index,),),
          ),
          const SizedBox(
            height: 24,
          ),
          Divider(
            color: CONSTANTS.colorFromHex("000000").withOpacity(0.5),
            //thickness: 1,
          ),
          Text("Overview",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: CONSTANTS.colorFromHex("202C43"),
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),),
          const SizedBox(
            height: 14,
          ),
          Text(upcomingDetail.upcomingDetailResp.value.overview.toString(),
            textAlign: TextAlign.left,
            style: TextStyle(
                color: CONSTANTS.colorFromHex("8F8F8F"),
                fontSize: 12,
                fontWeight: FontWeight.w500
            ),),
        ],
      ),
    );
  }
}
