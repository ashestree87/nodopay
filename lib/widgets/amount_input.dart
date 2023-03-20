import 'package:flutter/material.dart';

class AmountInput extends StatelessWidget {
  final Function(String) onAmountEntered;

  AmountInput({required this.onAmountEntered});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Enter amount'),
      onChanged: (value) => onAmountEntered(value),
    );
  }
}
