import 'package:flutter/material.dart';
import 'add_expense_screen.dart';
import 'analytics_screen.dart';
import '../services/expense_service.dart';
import '../widgets/expense_card.dart';
import '../widgets/expense_chart.dart';
import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ExpenseService expenseService = ExpenseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExpenseChart(),
            _buildTotalExpenses(),
            _buildExpenseList(),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButtons(),
    );
  }

  Widget _buildExpenseChart() {
    return ExpenseChart(expenseService: expenseService);
  }

  Widget _buildTotalExpenses() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        '$totalExpensesLabel: \$${expenseService.totalExpenses.toStringAsFixed(2)}',
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildExpenseList() {
    return Expanded(
      child: ListView.builder(
        itemCount: expenseService.expenses.length,
        itemBuilder: (ctx, index) {
          return ExpenseCard(expense: expenseService.expenses[index]);
        },
      ),
    );
  }

  Widget _buildFloatingActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildAddExpenseButton(),
        const SizedBox(width: 16), // Space between buttons
        _buildAnalyticsButton(),
      ],
    );
  }

  Widget _buildAddExpenseButton() {
    return FloatingActionButton(
      onPressed: () {
        _navigateToAddExpenseScreen();
      },
      tooltip: 'Add Expense',
      child: const Icon(Icons.add),
    );
  }

  Widget _buildAnalyticsButton() {
    return FloatingActionButton(
      onPressed: () {
        _navigateToAnalyticsScreen();
      },
      tooltip: 'View Analytics',
      child: const Icon(Icons.analytics),
    );
  }

  void _navigateToAddExpenseScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddExpenseScreen(expenseService: expenseService),
      ),
    ).then((_) {
      setState(() {
        // Refresh the screen after returning from AddExpenseScreen
      });
    });
  }

  void _navigateToAnalyticsScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AnalyticsScreen(expenseService: expenseService),
      ),
    );
  }
}
