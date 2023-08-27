// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pencatat_pengeluaran/data/pengeluaran.dart';

class CustomDropdownButton extends StatelessWidget {
  final Category selectedCategory;
  final void Function(Category category) setCategory;

  const CustomDropdownButton({
    super.key,
    required this.selectedCategory,
    required this.setCategory,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedCategory,
      items: Category.values
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e.name,
                  style: GoogleFonts.roboto(
                      color: const Color(0xFF156A78),
                      fontWeight: FontWeight.w500),
                ),
              ))
          .toList(),
      onChanged: (value) {
        setCategory(value!);
      },
    );
  }
}
