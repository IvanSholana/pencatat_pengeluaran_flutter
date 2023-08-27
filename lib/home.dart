// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pencatat_pengeluaran/components/Chart.dart';
import 'package:pencatat_pengeluaran/components/ListCard.dart';
import 'package:pencatat_pengeluaran/data/pengeluaran.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
    required this.LogoutScreen,
    required this.pengeluaran,
  });
  void Function() LogoutScreen;

  List<Pengeluaran> pengeluaran;
  @override
  State<HomeScreen> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  void DeletePengeluaran(Pengeluaran pengeluaran) {
    var indexOfPengeluaran = listPengeluaran.indexOf(pengeluaran);
    setState(() {
      listPengeluaran.remove(pengeluaran);
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Pengeluaran Dihapus"),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
          label: "Batal",
          onPressed: () {
            setState(() {
              listPengeluaran.insert(indexOfPengeluaran, pengeluaran);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          ChartBar(listPengeluaran: listPengeluaran),
          Expanded(
            child: Center(
              child: CardList(
                  pengeluaran: listPengeluaran,
                  removePengeluaran: DeletePengeluaran),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF156A78),
                      foregroundColor: Colors.white),
                  onPressed: () {
                    widget.LogoutScreen();
                  },
                  child: const Text('Keluar'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
