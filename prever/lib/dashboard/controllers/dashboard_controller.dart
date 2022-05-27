import 'dart:html';

import 'package:get/get.dart';

class DashBoardController extends GetxController{
  RxInt counter=0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    counter(0);
    update();
  }

  incrementCounter(){
    counter++;
    update();
  }
}