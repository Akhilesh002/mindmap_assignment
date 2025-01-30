import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../util/util.dart";
import "transactions_controller.dart";

class TransactionsScreen extends StatelessWidget {
  TransactionsScreen({super.key});

  final thisController = Get.put(TransactionsController());

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: const Text(
              "Transactions",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        final list = snapshot.data?.values.toList(growable: true) ?? [];
                        if (list.isEmpty) {
                          return const Center(
                            child: Text(
                              "There are no any transactions present right now.",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          );
                        }
                        final d = list[index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Transaction Amount: ${d.amount}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  )),
                              Text("Transaction Time: ${d.transactionDateTime}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(color: Colors.black),
                      itemCount: snapshot.data?.values.toList(growable: true).length ?? 0);
                }
                return errorWidget();
              }
              return errorWidget();
            },
            future: Util.getBox(),
          ).paddingSymmetric(horizontal: 16, vertical: 12),
        ),
      );

  Widget errorWidget() => const Center(
        child: Text(
          "Something went wrong, Please try again!!",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
}
