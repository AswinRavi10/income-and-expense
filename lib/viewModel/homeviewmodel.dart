import 'package:flutter/material.dart';
import 'package:money_management1/model/expencemodel.dart';
import 'package:money_management1/model/incomemodel.dart';
import 'package:hive/hive.dart';

class HomeViewModel extends ChangeNotifier {
  late Box<IncomeTransaction> _incomeBox;
  late Box<ExpenseTransaction> _expenseBox;

  HomeViewModel() {
    _incomeBox = Hive.box<IncomeTransaction>('income_transactions');
    _expenseBox = Hive.box<ExpenseTransaction>('expense_transactions');
  }

  double get totalIncome =>
      _incomeBox.values.fold(0, (sum, transaction) => sum + (transaction.amount ?? 0));

  double get totalExpenses =>
      _expenseBox.values.fold(0, (sum, transaction) => sum + (transaction.amount ?? 0));

  double get currentBalance => totalIncome - totalExpenses;

  void notifyChange() {
    notifyListeners();
  }
}
