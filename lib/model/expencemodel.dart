
// import 'package:hive/hive.dart';


// @HiveType(typeId: 1)
// class ExpenseTransaction extends HiveObject {


//   @HiveField(1)
//   late double amount;

//   ExpenseTransaction(this.amount);
// }
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class ExpenseTransaction {
 
  @HiveField(1)
  double amount = 0.0; 
  ExpenseTransaction({required this.amount});
}
