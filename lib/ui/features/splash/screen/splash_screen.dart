import "package:flutter/material.dart";
import "package:get/get.dart";

import "../controller/splash_controller.dart";

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final thisController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) => const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text(
              "Splash Animation",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
}
