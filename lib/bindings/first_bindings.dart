import 'package:flutter_tutorial/services/api_service.dart';
import 'package:get/get.dart';

import '../controllers/first_cotroller.dart';

class FirstBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(ApiService());
     Get.put(FirstController());
  }
}