import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../services/expense_service.dart';
import '../models/expense.dart';

class ExpenseChart extends StatelessWidget {
  final ExpenseService expenseService;

  const ExpenseChart({Key? key, required this.expenseService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
          ),
          borderData: FlBorderData(show: true),
          barGroups: _createBarGroups(),
        ),
      ),
    );
  }

  List<BarChartGroupData> _createBarGroups() {
    final Map<String, double> expenseCategories = {};

    // Kategoryzacja wydatków na podstawie tytułu
    for (var expense in expenseService.expenses) {
      String category = expense.title; // Użycie 'title' zamiast 'description'
      if (expenseCategories.containsKey(category)) {
        expenseCategories[category] = expenseCategories[category]! + expense.amount;
      } else {
        expenseCategories[category] = expense.amount;
      }
    }

    return expenseCategories.entries.map((entry) {
      return BarChartGroupData(
        x: entry.key.hashCode % 12, // Można dostosować do liczby kategorii
        barRods: [
          BarChartRodData(
            toY: entry.value,
            color: Colors.blue,
            width: 30,
          ),
        ],
      );
    }).toList();
  }
}
