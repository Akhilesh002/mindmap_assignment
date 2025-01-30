import "package:get/get.dart";

import "../../login/login_screen.dart";

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Future.delayed(2.seconds, (){
      Get.offAll(() => LoginScreen());
    });
  }
}