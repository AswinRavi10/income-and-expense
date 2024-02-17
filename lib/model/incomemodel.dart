import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class IncomeTransaction {
 
  @HiveField(1)
  double amount = 0.0; 
  IncomeTransaction({required this.amount});
}
