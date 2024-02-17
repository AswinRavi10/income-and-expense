import 'package:flutter/material.dart';
import 'package:money_management1/model/incomemodel.dart';
import 'package:money_management1/viewModel/homeviewmodel.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';

class IncomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final incomeBox = Hive.box<IncomeTransaction>('income_transactions');
    final TextEditingController amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Income'),
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
                  final newTransaction = IncomeTransaction(amount: amount);
                  incomeBox.add(newTransaction);
                  Provider.of<HomeViewModel>(context, listen: false).notifyChange();
                  Navigator.pop(context, amount); // Pass amount back to HomeScreen
                } else {
                  // Show error message or handle invalid input
                  throw Exception('Invalid input');
                }
              },
              child: Text('Add Income'),
            ),
          ],
        ),
      ),
    );
  }
}
