import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CONSTANTS{
  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  static void navigateToScreen(BuildContext context, screen) {
    Get.to(screen,duration: const Duration(seconds: 0));
  }

  static void replaceScreen(BuildContext context, screen) {
    Get.off(screen,duration: const Duration(seconds: 0));
  }

  static void replaceAllScreen(BuildContext context, screen) {
    Get.offAll(screen,duration: const Duration(seconds: 0));
  }
  static const String dbApiKey="425f7259586d57609aabba780062c6fe";
}