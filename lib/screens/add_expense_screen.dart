import 'package:flutter/material.dart';
import '../services/expense_service.dart';
import '../models/expense.dart';
import '../utils/constants.dart';

class AddExpenseScreen extends StatefulWidget {
  final ExpenseService expenseService;

  const AddExpenseScreen({Key? key, required this.expenseService}) : super(key: key);

  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final double amount = double.parse(_amountController.text);
      final String description = _descriptionController.text;

      // Create a new Expense object
      final Expense expense = Expense(
        id: UniqueKey().toString(), // Generate a unique ID
        title: description,
        amount: amount,
        date: DateTime.now(),
      );

      // Add the expense
      widget.expenseService.addExpense(expense);

      // Go back to the previous screen
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(addExpenseLabel),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildAmountField(),
              const SizedBox(height: 16), // Increased space for better separation
              _buildDescriptionField(),
              const SizedBox(height: 24), // More space before the button
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmountField() {
    return TextFormField(
      controller: _amountController,
      decoration: InputDecoration(
        labelText: 'Amount',
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an amount.';
        }
        final double? amount = double.tryParse(value);
        if (amount == null || amount <= 0) {
          return 'Please enter a positive number.';
        }
        return null; // Value is valid
      },
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      controller: _descriptionController,
      decoration: InputDecoration(
        labelText: 'Description',
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a description.';
        }
        return null; // Value is valid
      },
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _submitForm,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: const TextStyle(fontSize: 18), // Larger text for better visibility
      ),
      child: const Text('Add Expense'),
    );
  }
}
