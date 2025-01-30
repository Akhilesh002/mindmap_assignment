import "package:flutter/material.dart";
import "package:get/get.dart";

class ResultBottomSheet extends StatelessWidget {
  const ResultBottomSheet({super.key, required this.isSuccess, required this.amount});

  final bool isSuccess;
  final double amount;

  @override
  Widget build(BuildContext context) => Material(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Amount RS $amount sent successfully!!",
                style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                  // fixedSize: MaterialStateProperty.all<Size>(const Size(200, 48))
                ),
                child: const Text(
                  "Got it",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
