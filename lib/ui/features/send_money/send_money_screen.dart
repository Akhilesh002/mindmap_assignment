import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";

import "../../../util/util.dart";
import "../transactions/models/transaction_model.dart";
import "send_money_controller.dart";
import "widgets/result_bottom_sheet.dart";

class SendMoneyScreen extends StatelessWidget {
  SendMoneyScreen({super.key});

  final thisController = Get.put(SendMoneyController());

  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: const Text(
              "Sand money",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: amountController,
                keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  hintText: "Enter Amount",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  await addTransaction();
                  await Get.bottomSheet(
                    ResultBottomSheet(
                      isSuccess: true,
                      amount: double.tryParse(amountController.text) ?? 0,
                    ),
                    barrierColor: Colors.black54,
                  );
                  amountController.text = "";
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                  // fixedSize: MaterialStateProperty.all<Size>(const Size(200, 48))
                ),
                child: const Text(
                  "Send",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 16, vertical: 10),
        ),
      );

  Future<void> addTransaction() async {
    final amount = double.tryParse(amountController.text) ?? 0;
    final now = DateTime.now();
    final box = await Util.getBox();
    box.add(TransactionModel(amount, now, true));
  }
}
