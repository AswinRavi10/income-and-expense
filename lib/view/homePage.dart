import 'package:flutter/material.dart';
import 'package:money_management1/view/expence.dart';
import 'package:money_management1/view/incomepage.dart';
import 'package:money_management1/viewModel/homeviewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double? enteredAmount = ModalRoute.of(context)?.settings.arguments as double?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Money Management App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<HomeViewModel>(
              builder: (context, homeViewModel, _) {
                return Text(
                  'Total Income: \$${homeViewModel.totalIncome.toStringAsFixed(2)}',
                );
              },
            ),
            Consumer<HomeViewModel>(
              builder: (context, homeViewModel, _) {
                return Text(
                  'Total Expenses: \$${homeViewModel.totalExpenses.toStringAsFixed(2)}',
                );
              },
            ),
            Consumer<HomeViewModel>(
              builder: (context, homeViewModel, _) {
                return Text(
                  'Current Balance: \$${homeViewModel.currentBalance.toStringAsFixed(2)}',
                );
              },
            ),
            SizedBox(height: 20),
            enteredAmount != null ? Text('Entered Amount: \$${enteredAmount.toStringAsFixed(2)}') : SizedBox(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IncomeScreen()),
                );
              },
              child: Text('Add Income'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExpenseScreen()),
                );
              },
              child: Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
