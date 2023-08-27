// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pencatat_pengeluaran/data/pengeluaran.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.listPengeluaran});
  final List<Pengeluaran> listPengeluaran;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        margin: const EdgeInsets.only(top: 10, left: 9, right: 9),
        padding: const EdgeInsets.all(10),
        height: 150,
        width: constraints.maxWidth,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
          gradient: const LinearGradient(
            colors: [Color(0xFF9DC964), Color(0xFFF9DB59)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: listPengeluaran.isNotEmpty
                ? hitungData(listPengeluaran).entries.map((entry) {
                    final category = entry.key;
                    final count = entry.value;
                    final total = totalSemua(listPengeluaran);

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 50,
                              height: (count / total) * 100,
                              color: const Color(0xFF2F4858),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Icon(
                          IconCategory[category],
                          color: const Color(0xff2F4858),
                        ),
                      ],
                    );
                  }).toList()
                : Category.values.map((category) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 50,
                              height: 0,
                              color: const Color(0xFF2F4858),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Icon(
                          IconCategory[category],
                          color: const Color(0xff2F4858),
                        ),
                      ],
                    );
                  }).toList(),
          ),
        ),
      ),
    );
  }
}
