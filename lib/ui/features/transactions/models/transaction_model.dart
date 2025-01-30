
import "package:hive/hive.dart";
part "transaction_model.g.dart";

@HiveType(typeId: 0)
class TransactionModel{
  @HiveField(0)
  final double amount;
  @HiveField(1)
  final DateTime transactionDateTime;
  @HiveField(2)
  final bool isSuccess;

  const TransactionModel(this.amount, this.transactionDateTime, this.isSuccess);
}