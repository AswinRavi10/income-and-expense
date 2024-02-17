import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_management1/adapters/expenseadapter.dart' ;
import 'package:money_management1/adapters/incomeadapter.dart' as IncomeAdapter; // Add alias here
import 'package:money_management1/model/expencemodel.dart';
import 'package:money_management1/model/incomemodel.dart';
import 'package:money_management1/view/homePage.dart';
import 'package:money_management1/viewModel/homeviewmodel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final appDocumentDir = await getApplicationDocumentsDirectory();
  final appDocumentPath = appDocumentDir.path;
  
  await Hive.initFlutter();
  Hive.registerAdapter(IncomeAdapter.IncomeTransactionAdapter()); // Use the alias
  Hive.registerAdapter(ExpenseTransactionAdapter()); // Register the adapter for ExpenseTransaction
  
  await Hive.openBox<IncomeTransaction>('income_transactions');
  await Hive.openBox<ExpenseTransaction>('expense_transactions');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: MaterialApp(
        title: 'Money Management App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
