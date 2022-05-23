import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty/models/upcoming_model/upcoming_model.dart';
import 'package:tentwenty/urls.dart';

import '../../helpers/constants.dart';
import '../../network/api_service.dart';
import '../../network/api_statuses.dart';

class UpcomingController extends GetxController{
  var upcomingResp=Upcoming().obs;
  var isLoading=true.obs;
  var isListNull=false.obs;
  @override
  void onInit(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getUpcomingData();
    });
     super.onInit();
  }

  getUpcomingData() async {
    isLoading(true).obs;
    isListNull(false).obs;

    var detail=await APIService.getRequest(apiName: URLS.upcoming+"?api_key=${CONSTANTS.dbApiKey}", headers: {});

    if(detail!=null)
    {
      try{
        upcomingResp.value= upcomingFromJson(detail.toString());
        if(upcomingResp.value.results!.isEmpty)
        {
          isListNull(true).obs;
        }
        else{
          isListNull(false).obs;
        }
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