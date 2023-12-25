import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLocalController extends GetxController{

  void changeLang(String codeLang){
    Locale locale= Locale(codeLang);
    Get.updateLocale(locale) ;
  }
  Locale getCurrentLocale() {
    return Get.locale ?? Locale('en', 'US');// Default to English if locale is null
   
  }
}