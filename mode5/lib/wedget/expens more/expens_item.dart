import 'package:flutter/material.dart';
import 'package:mode5/models/expens.dart';

// ignore: camel_case_types
class expensitem extends StatelessWidget {
  const expensitem(
    this.expens, {
    super.key,
  });

  final Expens expens;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 1,
        horizontal: 8,
      ),
      child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            
            Text(expens.titel, style: const TextStyle(fontSize: 19)),
            const SizedBox(height: 8),
            Row(
              children: [
                Text('\$${expens.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(catogeryicons[expens.catogery]),
                    const SizedBox(width: 8),
                    Text(expens.formateddate),
                  ],
                ),
              ],
            ),
        ],
      ),
          )),
    );
  }
}
