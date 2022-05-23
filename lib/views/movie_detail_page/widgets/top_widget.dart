import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/upcomig_detail_controller/upcoming_detail_controller.dart';
import '../../../controllers/video_trailer_controller/video_trailer_controller.dart';
import '../../../helpers/constants.dart';
import '../../../urls.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_outline_button.dart';
import '../../widgets/custom_progress_indocator.dart';
class TopWidget extends StatelessWidget {
  final  trailerController=Get.put(VideoTrailerController());
  final UpcomingDetailController upcomingDetail;
  final int movieId;
   TopWidget({Key? key, required this.upcomingDetail, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 466,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: CachedNetworkImageProvider(URLS.BASE_URL_IMAGES+upcomingDetail.upcomingDetailResp.value.backdropPath.toString(),),
              fit: BoxFit.cover
          )
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 64,
                bottom: 80,
                right: 24.25,
                left: 24.25),
            height: 164,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap:(){
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios, color: Colors.white,),
                ),
                const SizedBox(width: 26.25,),
                Text("Watch",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: CONSTANTS.colorFromHex("FFFFFF"),
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),),
              ],),
          ),
          Container(
            padding: const EdgeInsets.only(top: 86,
                bottom: 29,
                right: 66,
                left: 66),
            height: 302,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(upcomingDetail.upcomingDetailResp.value.title.toString(),
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: CONSTANTS.colorFromHex("FFFFFF"),
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),),
                const SizedBox(
                  height: 6,
                ),
                Text("In Theaters "+DateFormat.MMMM().format(upcomingDetail.upcomingDetailResp.value.releaseDate!)+" "+DateFormat.d().format(upcomingDetail.upcomingDetailResp.value.releaseDate!)+", "+DateFormat.y().format(upcomingDetail.upcomingDetailResp.value.releaseDate!),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: CONSTANTS.colorFromHex("FFFFFF"),
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  text: "Get Tickets",
                  onPressed: () {

                  },
                  height: 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx((){
                  if(trailerController.isLoading.value)
                  {
                    return customProgressIndicator();
                  }
                  else {
                    return CustomOutlineButton(
                      text: "Watch Trailer",
                      iconData: Icons.play_arrow,
                      onPressed: () {
                        trailerController.getTrailerDetailData(movieId);
                      },
                      height: 50,
                    );
                  }
                }
                )
              ],),
          ),
        ],
      ),
    );
  }
}

