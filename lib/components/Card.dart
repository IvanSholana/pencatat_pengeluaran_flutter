import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pencatat_pengeluaran/data/pengeluaran.dart';

class CardContent extends StatelessWidget {
  const CardContent(
      {super.key, required this.pengeluaran, required this.removePengeluaran});

  final void Function(Pengeluaran pengeluaran) removePengeluaran;

  final Pengeluaran pengeluaran;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pengeluaran.namaPengeluaran,
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF156A78),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rp ${NumberFormat('#,###').format(pengeluaran.hargaPengeluaran)}',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: const Color(0xFF156A78),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      IconCategory[pengeluaran
                          .category], // Assuming Pengeluaran's category has an IconData property
                      color: const Color(0xFF156A78),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      DateFormat('y/M/d').format(DateTime.now()),
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: const Color(0xFF156A78),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
