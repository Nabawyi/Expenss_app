import 'package:flutter/material.dart';
import 'package:mode5/models/expens.dart';
import 'package:mode5/wedget/expens%20more/expens_item.dart';

class Expenslist extends StatelessWidget {
  const Expenslist(
      {super.key, required this.expenss, required this.onRemovedexpens});

  final List<Expens> expenss;
  final void Function(Expens expens) onRemovedexpens;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenss.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: const EdgeInsets.symmetric(horizontal: 16),
        ),
        key: ValueKey(expenss[index]),
        onDismissed: (direction) {
          onRemovedexpens(expenss[index]);
        },
        child: expensitem(expenss[index]),
      ),
    );
  }
}
