import "package:hive/hive.dart";

import "../ui/features/transactions/models/transaction_model.dart";

class Util {
  static Future<void> openBox() async {
    await Hive.openBox<TransactionModel>("transactions");
  }

  static Future<Box<TransactionModel>> getBox() async => Hive.box<TransactionModel>("transactions");
}