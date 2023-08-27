// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum Category { Food, Work, Holiday, Health }

final IconCategory = {
  Category.Food: (Icons.fastfood),
  Category.Work: (Icons.work),
  Category.Holiday: (Icons.airplanemode_active_rounded),
  Category.Health: (Icons.health_and_safety)
};

class Pengeluaran {
  Pengeluaran(
      {required this.namaPengeluaran,
      required this.hargaPengeluaran,
      required this.tanggalPengeluaran,
      required this.category});

  String namaPengeluaran;
  double hargaPengeluaran;
  DateTime tanggalPengeluaran;
  Category category;
  String idPengeluaran = const Uuid().v4();
}

List<Pengeluaran> listPengeluaran = [
  Pengeluaran(
    namaPengeluaran: "Ayam Geprek",
    hargaPengeluaran: 10000,
    tanggalPengeluaran: DateTime.now(),
    category: Category.Food,
  ),
  Pengeluaran(
    namaPengeluaran: "Office Supplies",
    hargaPengeluaran: 250000,
    tanggalPengeluaran: DateTime(2023, 8, 15),
    category: Category.Work,
  ),
  Pengeluaran(
    namaPengeluaran: "Beach Vacation",
    hargaPengeluaran: 1500000,
    tanggalPengeluaran: DateTime(2023, 7, 10),
    category: Category.Holiday,
  ),
  Pengeluaran(
    namaPengeluaran: "Gym Membership",
    hargaPengeluaran: 750000,
    tanggalPengeluaran: DateTime(2023, 8, 1),
    category: Category.Health,
  ),
  Pengeluaran(
    namaPengeluaran: "Burger King",
    hargaPengeluaran: 35000,
    tanggalPengeluaran: DateTime(2023, 8, 22),
    category: Category.Food,
  ),
  Pengeluaran(
    namaPengeluaran: "Office Laptop",
    hargaPengeluaran: 12000000,
    tanggalPengeluaran: DateTime(2023, 7, 5),
    category: Category.Work,
  ),
  Pengeluaran(
    namaPengeluaran: "Mountain Trekking",
    hargaPengeluaran: 800000,
    tanggalPengeluaran: DateTime(2023, 8, 10),
    category: Category.Holiday,
  ),
  Pengeluaran(
    namaPengeluaran: "Yoga Classes",
    hargaPengeluaran: 300000,
    tanggalPengeluaran: DateTime(2023, 8, 3),
    category: Category.Health,
  ),
  Pengeluaran(
    namaPengeluaran: "Pizza Hut",
    hargaPengeluaran: 45000,
    tanggalPengeluaran: DateTime(2023, 8, 18),
    category: Category.Food,
  ),
  Pengeluaran(
    namaPengeluaran: "Printer Ink",
    hargaPengeluaran: 150000,
    tanggalPengeluaran: DateTime(2023, 7, 12),
    category: Category.Work,
  ),
  Pengeluaran(
    namaPengeluaran: "Spa Retreat",
    hargaPengeluaran: 1200000,
    tanggalPengeluaran: DateTime(2023, 7, 20),
    category: Category.Holiday,
  ),
];

Map<Category, double> hitungData(List<Pengeluaran> pengeluaran) {
  var jumlahData = <Category, double>{};
  for (var category in Category.values) {
    List<Pengeluaran> perKategori =
        pengeluaran.where((element) => element.category == category).toList();
    jumlahData[category] = hitungJumlah(perKategori);
  }

  return jumlahData;
}

double hitungJumlah(List<Pengeluaran> pengeluaran) {
  double amount = 0;
  for (var item in pengeluaran) {
    amount += item.hargaPengeluaran;
  }
  return amount;
}

double totalSemua(List<Pengeluaran> pengeluaran) {
  double amount = 0;
  for (var item in pengeluaran) {
    amount += item.hargaPengeluaran;
  }
  return amount;
}
