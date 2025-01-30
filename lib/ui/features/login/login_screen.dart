import "package:flutter/material.dart";
import "package:get/get.dart";

import "../dashboard/dashboard_screen.dart";

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: const Text(
              "Login Screen",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: SizedBox(height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 0),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: userNameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.all(16),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.all(16),
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if(userNameController.text.toLowerCase() == "user" && passwordController.text.toLowerCase() == "user") {
                      Get.offAll(() => DasBoardScreen());
                    } else {
                      Get.showSnackbar(const GetSnackBar(message:"Invalid Credentials", duration: Duration(seconds: 1),));
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                    fixedSize: MaterialStateProperty.all<Size>(const Size(200, 48))
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 10),
          ),
        ),
      );
}
