import 'dart:convert';


import 'package:get/get.dart';
import 'package:tentwenty/urls.dart';

import '../../helpers/constants.dart';
import '../../models/video_trailer_model/video_trailer_model.dart';
import '../../network/api_service.dart';
import '../../network/api_statuses.dart';
import '../../views/widgets/youtube_player.dart';

class VideoTrailerController extends GetxController{
  var trailerResp=VideoTrailer().obs;
  var isLoading=false.obs;
  var isListNull=false.obs;

  getTrailerDetailData(int movieId) async {
    isLoading(true).obs;
    isListNull(false).obs;

    var detail=await APIService.getRequest(apiName: URLS.upcomingMovieDetail+"$movieId/videos?api_key=${CONSTANTS.dbApiKey}", headers: {});

    if(detail!=null)
    {
      try{
        trailerResp.value= videoTrailerFromJson(detail.toString());
        CONSTANTS.navigateToScreen(
            Get.context!, YoutubeVideo(videoUrl:trailerResp.value.results!.first.key.toString()));
        isListNull(false).obs;
        isLoading(false).obs;
      }
      catch(e)
      {
        var response=json.decode(detail.toString());
        isLoading(false).obs;
        isListNull(true).obs;
        APISTATUS.apiStatuses(response["status_code"],response["status_message"]);
      }
    }
    else{
      isLoading(false).obs;
      isListNull(true).obs;
    }
  }
}