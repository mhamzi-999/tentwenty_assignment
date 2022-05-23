
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:tentwenty/helpers/constants.dart';

import '../globals.dart';
import '../urls.dart';
import '../views/widgets/custom_snackbar.dart';
class APIService {
  static var client=http.Client();


static Future<String?> postRequest({
  required String apiName,
   required bool isJson,
  required Map<String, dynamic> mapData,
  required Map<String, String> headers}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.mobile &&
          connectivityResult != ConnectivityResult.wifi) {
        errorSnackbar("No internet connection, Please connect to internet");
        return null;
      }
      if(debugMode) print("response:${ apiName}");
      var response = await client.post(
          Uri.parse(URLS.BASE_URL + apiName), body: isJson?json.encode(mapData):mapData, headers: headers)
          .timeout(const Duration(seconds: 30));
      if(debugMode)print(apiName+response.statusCode.toString());
      if(debugMode)debugPrint(response.body,wrapWidth: 1024);
      var statusCode = response.statusCode;
      switch (statusCode) {
        case HttpStatus.ok:
          var jsonString = response.body;
          return jsonString;
          break;
        case HttpStatus.gatewayTimeout:
          errorSnackbar("No response from server, Please try again");
          return null;
          break;
        default:
          errorSnackbar("Something went wrong, Please try again");
          return null;
          break;
      }
    }catch(e)
  {
    if(debugMode)print(e);
    errorSnackbar("Something went wrong, Please try again"+" "+e.toString());
    return null;
  }
}




  static Future<String?> getRequest({
    required String apiName,
    required Map<String, String> headers}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.mobile &&
          connectivityResult != ConnectivityResult.wifi) {
        errorSnackbar("No internet connection, Please connect to internet");
        return null;
      }
      if(debugMode) print("response:$apiName");
      var response = await client.get(
          Uri.parse(URLS.BASE_URL + apiName), headers: headers)
          .timeout(const Duration(seconds: 30));

      if(debugMode)print(response.body);
      var statusCode = response.statusCode;
      switch (statusCode) {
        case HttpStatus.ok:
          var jsonString = response.body;
          if (debugMode) debugPrint(jsonString, wrapWidth: 1024);
          return jsonString;
          break;
        case HttpStatus.gatewayTimeout:
          errorSnackbar("No response from server, Please try again");
          return null;
          break;
        default:
          errorSnackbar("Something went wrong, Please try again");
          return null;
          break;
      }
    }catch(e)
    {
      if(debugMode)print(e);
      errorSnackbar("Something went wrong, Please try again"+" "+e.toString());
      return null;
    }
  }
}