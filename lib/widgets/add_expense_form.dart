import 'package:flutter/material.dart';

class AddExpenseForm extends StatefulWidget {
  const AddExpenseForm({super.key});

  @override
  State<AddExpenseForm> createState() {
    return _AddExpenseFormState();
  }
}

class _AddExpenseFormState extends State<AddExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  // We should always dispose controller - because it's a resource that needs to be cleaned up
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: "Title"),
            maxLength: 50,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _amountController,
            decoration:
                const InputDecoration(labelText: "Amount", prefixText: "\$"),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  print(_amountController.text);
                },
                child: const Text("Add Expense"),
              ),
            ],
          ),
        ]));
  }
}
