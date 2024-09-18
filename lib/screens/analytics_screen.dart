import 'package:flutter/material.dart';
import '../services/expense_service.dart';
import '../widgets/expense_chart.dart';

class AnalyticsScreen extends StatelessWidget {
  final ExpenseService expenseService;

  const AnalyticsScreen({Key? key, required this.expenseService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTotalExpenses(),
            const SizedBox(height: 20),
            _buildMonthlyExpensesTitle(),
            const SizedBox(height: 10),
            _buildExpenseChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalExpenses() {
    return Text(
      'Total Expenses: \$${expenseService.totalExpenses.toStringAsFixed(2)}',
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildMonthlyExpensesTitle() {
    return Text(
      'Monthly Expenses Overview',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600, // Use a slightly lighter weight for differentiation
        color: Colors.black54,
      ),
    );
  }

  Widget _buildExpenseChart() {
    return Expanded(
      child: ExpenseChart(expenseService: expenseService),
    );
  }
}
