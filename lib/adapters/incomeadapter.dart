// incomeadapter.dart

import 'package:hive/hive.dart';
import 'package:money_management1/model/incomemodel.dart';

class IncomeTransactionAdapter extends TypeAdapter<IncomeTransaction> {
  @override
  final int typeId = 0; // Unique identifier for this TypeAdapter

  @override
  IncomeTransaction read(BinaryReader reader) {
    // Read the amount from the binary reader
    final amount = reader.readDouble();
    
    // Return a new instance of IncomeTransaction with the read amount
    return IncomeTransaction(amount: amount);
  }

  @override
  void write(BinaryWriter writer, IncomeTransaction obj) {
    writer.writeDouble(obj.amount); // Write the amount
  }
}
