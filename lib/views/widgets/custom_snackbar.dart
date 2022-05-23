import 'package:flutter/material.dart';
import 'package:get/get.dart';

 errorSnackbar(String errorMsg){
  return  Get.snackbar(
    "Error",
    errorMsg,
    icon: const Icon(
      Icons.error_outline,
      color: Colors.white,
    ),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    duration: const Duration(milliseconds: 1100),
    snackbarStatus: (status) {
      if(status==SnackbarStatus.CLOSED)
      {
      }
    },
  );
}
