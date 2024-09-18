import 'package:expense_tracker/models/expense.dart'; 

class ExpenseService {
  final List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  void addExpense(Expense expense) {
    _expenses.add(expense);
  }

  double get totalExpenses {
    return _expenses.fold(0.0, (sum, item) => sum + item.amount);
  }
}
