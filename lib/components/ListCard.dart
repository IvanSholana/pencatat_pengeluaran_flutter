// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pencatat_pengeluaran/data/pengeluaran.dart';
import 'package:pencatat_pengeluaran/components/Card.dart';

class CardList extends StatelessWidget {
  CardList(
      {super.key, required this.pengeluaran, required this.removePengeluaran});
  List<Pengeluaran> pengeluaran;
  void Function(Pengeluaran pengeluaran) removePengeluaran;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        padding: const EdgeInsets.only(left: 7),
        alignment: Alignment.topLeft,
        child: Text(
          "Detail Pengeluaran",
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: pengeluaran.length,
          itemBuilder: (context, index) => Dismissible(
            onDismissed: (direction) {
              removePengeluaran(pengeluaran[index]);
            },
            key: ValueKey(pengeluaran[index]),
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0x0ff9db59), Color(0xFFBACB4E)],
                ),
              ),
            ),
            child: CardContent(
              pengeluaran: pengeluaran[index],
              removePengeluaran: removePengeluaran,
            ),
          ),
        ),
      )
    ]);
  }
}
