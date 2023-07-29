import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formater = DateFormat.yMd();
const uuid = Uuid();

enum Catogery { food, leisure, travil, work }

const catogeryicons = {
  Catogery.food: Icons.lunch_dining,
  Catogery.leisure: Icons.movie,
  Catogery.travil: Icons.flight_takeoff,
  Catogery.work: Icons.work,
};

class Expens {
  Expens(
      {required this.titel,
      required this.amount,
      required this.date,
      required this.catogery})
      : id = uuid.v4();

  final String id;
  final String titel;
  final double amount;
  final DateTime date;
  final Catogery catogery;

  String get formateddate {
    return formater.format(date);
  }
}

class ExpensBuket {
  const ExpensBuket({
    required this.catogery,
    required this.expenss,
  });

  ExpensBuket.forcatogrey(List<Expens> allexpens, this.catogery)
      : expenss =
            allexpens.where((expenss) => expenss.catogery == catogery).toList();

  final Catogery catogery;
  final List<Expens> expenss;

  double get totalExpenss {
    double sum = 0;

    for (final exp in expenss) {
      sum += exp.amount;
    }
    return sum;
  }
}
