import 'package:get/get.dart';

class FirstController extends GetxController{
  var counter = 0.obs;
  void incrementCounter() {
    counter++;
  }
}