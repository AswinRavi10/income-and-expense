
import 'package:hive/hive.dart';
import 'package:money_management1/model/expencemodel.dart';


class ExpenseTransactionAdapter extends TypeAdapter<ExpenseTransaction> {
  @override
  final int typeId = 1; // Unique identifier for this TypeAdapter

  @override
  ExpenseTransaction read(BinaryReader reader) {
    // Read the amount from the binary reader
    final amount = reader.readDouble();
    
    // Return a new instance of IncomeTransaction with the read amount
    return ExpenseTransaction(amount: amount);
  }

  @override
  void write(BinaryWriter writer, ExpenseTransaction obj) {
    writer.writeDouble(obj.amount); // Write the amount
  }
}
