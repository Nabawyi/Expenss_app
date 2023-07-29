import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mode5/models/expens.dart';

class Newexpens extends StatefulWidget {
  const Newexpens({super.key, required this.onAddexpens});

  final void Function(Expens expens) onAddexpens;

  @override
  State<Newexpens> createState() => _NewexpensState();
}

// ignore: unused_element
class _NewexpensState extends State<Newexpens> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Catogery _selectedCatogery = Catogery.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submiitexpensdata() {
    final enteerdamount = double.tryParse(_amountController.text);
    final amountisvaild = enteerdamount == null || enteerdamount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountisvaild ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('invaild input'),
          content: const Text(
              'please make sure a valid titel ,amount ,date was enterd'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('okey'),
            )
          ],
        ),
      );
      return;
    }
    widget.onAddexpens(
      Expens(
          titel: _titleController.text,
          amount: enteerdamount,
          date: _selectedDate!,
          catogery: _selectedCatogery),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyspace = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(
      builder: (context, constraints) {
        final widtth = constraints.maxWidth;

        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 48, 16, keyspace + 16),
              child: Column(
                children: [
                  if (widtth >= 600)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _titleController,
                            maxLength: 50,
                            decoration: const InputDecoration(
                              label: Text('Title'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            decoration: const InputDecoration(
                                label: Text('Amount'), prefixText: "\$"),
                          ),
                        ),
                      ],
                    )
                  else
                    TextField(
                      controller: _titleController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Title'),
                      ),
                    ),
                  if (widtth >= 600)
                    Row(
                      children: [
                        DropdownButton<Catogery>(
                            value: _selectedCatogery,
                            items: Catogery.values
                                .map(
                                  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                                  (Catogery) => DropdownMenuItem(
                                    value: Catogery,
                                    child: Text(
                                      Catogery.name.toUpperCase(),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedCatogery = value!;
                              });
                            }),
                        const SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _selectedDate == null
                                    ? 'no date selected'
                                    : DateFormat.yMd().format(_selectedDate!),
                              ),
                              IconButton(
                                onPressed: () {
                                  return _presentDatePicker();
                                },
                                icon: const Icon(Icons.calendar_month),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            decoration: const InputDecoration(
                                label: Text('Amount'), prefixText: "\$"),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _selectedDate == null
                                    ? 'no date selected'
                                    : DateFormat.yMd().format(_selectedDate!),
                              ),
                              IconButton(
                                onPressed: () {
                                  return _presentDatePicker();
                                },
                                icon: const Icon(Icons.calendar_month),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  const SizedBox(
                    height: 16,
                  ),
                  if (widtth > 600)
                    Row(
                      children: [
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            return _submiitexpensdata();
                          },
                          child: const Text('save Expens'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('cancel'),
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        DropdownButton<Catogery>(
                            value: _selectedCatogery,
                            items: Catogery.values
                                .map(
                                  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                                  (Catogery) => DropdownMenuItem(
                                    value: Catogery,
                                    child: Text(
                                      Catogery.name.toUpperCase(),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedCatogery = value!;
                              });
                            }),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            return _submiitexpensdata();
                          },
                          child: const Text('save Expens'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('cancel'),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
