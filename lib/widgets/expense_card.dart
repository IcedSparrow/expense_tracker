import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;

  const ExpenseCard({Key? key, required this.expense}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(expense.title), // Używamy tytułu zamiast opisu
        subtitle: Text('\$${expense.amount.toStringAsFixed(2)}'),
      ),
    );
  }
}
