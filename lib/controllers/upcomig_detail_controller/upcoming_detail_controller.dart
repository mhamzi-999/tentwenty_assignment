import 'dart:convert';


import 'package:get/get.dart';
import 'package:tentwenty/urls.dart';

import '../../helpers/constants.dart';
import '../../models/upcoming_detail_model/upcoming_detail_model.dart';
import '../../network/api_service.dart';
import '../../network/api_statuses.dart';

class UpcomingDetailController extends GetxController{
  var upcomingDetailResp=UpcomingDetail().obs;
  var isLoading=true.obs;
  var isListNull=false.obs;

  getUpcomingDetailData(int movieId) async {
    isLoading(true).obs;
    isListNull(false).obs;

    var detail=await APIService.getRequest(apiName: URLS.upcomingMovieDetail+"$movieId?api_key=${CONSTANTS.dbApiKey}", headers: {});

    if(detail!=null)
    {
      try{
        upcomingDetailResp.value= upcomingDetailFromJson(detail.toString());
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