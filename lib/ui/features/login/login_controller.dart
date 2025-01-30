import "package:get/get.dart";

import "../dashboard/dashboard_screen.dart";

class LoginController extends GetxController {
  void doLogin(String userId, String password) {
    if(userId == "userid" && password == "password") {
      Get.offAll(() => DasBoardScreen());
    } else {
      Get.showSnackbar(const GetSnackBar(message:"Invalid Credentials", duration: Duration(seconds: 1),));
    }
  }
}
