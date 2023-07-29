import 'package:flutter/material.dart';
import 'package:mode5/chart/chart.dart';
import 'package:mode5/new_expens.dart';
import 'package:mode5/wedget/expens%20more/expens_list.dart';
import 'package:mode5/models/expens.dart';

// ignore: camel_case_types
class expenss extends StatefulWidget {
  const expenss({super.key});

  @override
  State<expenss> createState() => _expenssState();
}

// ignore: camel_case_types
class _expenssState extends State<expenss> {
  final List<Expens> _reqlest = [
    Expens(
      titel: 'flutter course',
      amount: 19.99,
      catogery: Catogery.work,
      date: DateTime.now(),
    ),
    Expens(
      titel: 'cinema',
      amount: 15.99,
      catogery: Catogery.leisure,
      date: DateTime.now(),
    ),
  ];
  void _openaddexpenssover() {
    showModalBottomSheet(
      
      
      isScrollControlled: true,
      context: context,
      builder: (context) => Newexpens(onAddexpens: _addexpenss),
    );
  }

  void _addexpenss(Expens expenss) {
    setState(() {
      _reqlest.add(expenss);
    });
  }

  void _removedexpenss(Expens expens) {
    final expensindex = _reqlest.indexOf(expens);
    setState(() {
      _reqlest.remove(expens);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('expenss delated'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _reqlest.insert(expensindex, expens);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final widthh = MediaQuery.of(context).size.width;
    Widget maincontant = const Center(
      child: Text("no expenss yet "),
    );
    if (_reqlest.isNotEmpty) {
      maincontant = Expenslist(
        expenss: _reqlest,
        onRemovedexpens: _removedexpenss,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenss tracker'),
        actions: [
          IconButton(
            onPressed: _openaddexpenssover,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: widthh < 600
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Chart(expenses: _reqlest),
                  Expanded(child: maincontant),
                ],
              ),
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _reqlest),
                ),
                Expanded(child: maincontant),
              ],
            ),
    );
  }
}
