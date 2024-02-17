import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_management1/model/expencemodel.dart';
import 'package:money_management1/viewModel/homeviewmodel.dart';
import 'package:provider/provider.dart';


class ExpenseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expenseBox = Hive.box<ExpenseTransaction>('expense_transactions');
   
    final TextEditingController amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            SizedBox(height: 16),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 16),
          ElevatedButton(
              onPressed: () {
                final amount = double.parse(amountController.text);

                if (amount > 0) {
                  final newTransaction = ExpenseTransaction (amount: amount);
                  expenseBox.add(newTransaction);
                  Provider.of<HomeViewModel>(context, listen: false).notifyChange();
                  Navigator.pop(context, amount); // Pass amount back to HomeScreen
                } else {
                  // Show error message or handle invalid input
                  throw Exception('Invalid input');
                }
              },
              child: Text('Add Expense'),
            ),
          ],
        ),
     ),
);
}
}