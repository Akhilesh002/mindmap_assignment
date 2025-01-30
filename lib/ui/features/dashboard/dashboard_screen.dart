import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../util/util.dart";
import "../login/login_screen.dart";
import "../send_money/send_money_screen.dart";
import "../transactions/transactions_screen.dart";
import "dashboard_controller.dart";

class DasBoardScreen extends StatelessWidget {
  DasBoardScreen({super.key});

  final thisController = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: const Text(
              "Dashboard",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [
              InkWell(
                onTap: () async {
                  final box = await Util.getBox();
                  box.clear();
                  Get.offAll(() => LoginScreen());
                },
                child: Text(
                  "Logout",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              SizedBox(width: 16)
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Balance",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Obx(() {
                                final isVisible = thisController.isAmountVisible.value;
                                return InkWell(
                                  onTap: () {
                                    thisController.isAmountVisible.value = !thisController.isAmountVisible.value;
                                  },
                                  child: Icon(
                                    isVisible ? Icons.visibility_off : Icons.visibility,
                                    size: 24,
                                    color: Colors.black,
                                  ),
                                );
                              })
                            ],
                          ),
                          const SizedBox(height: 20),
                          Obx(() {
                            final amount = thisController.amount.value;
                            final isVisible = thisController.isAmountVisible.value;
                            return Text(
                              "RS: ${isVisible ? amount : "****"}",
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          })
                        ],
                      ),
                      Container(
                        color: Colors.red,
                        child: Image.asset(
                          "assets/gif/wallet.gif",
                          height: 160,
                          width: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => SendMoneyScreen());
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                        // fixedSize: MaterialStateProperty.all<Size>(const Size(200, 48))
                      ),
                      child: const Text(
                        "Send Money",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => TransactionsScreen());
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                        // fixedSize: MaterialStateProperty.all<Size>(const Size(200, 48))
                      ),
                      child: const Text(
                        "View Transaction",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 12),
          ),
        ),
      );
}
