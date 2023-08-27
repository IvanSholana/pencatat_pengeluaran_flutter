// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pencatat_pengeluaran/data/pengeluaran.dart';
import 'package:pencatat_pengeluaran/components/Dropdown.dart';

class OverlayForm extends StatefulWidget {
  const OverlayForm({super.key, required this.addPengeluaran});

  final void Function(Pengeluaran pengeluaran) addPengeluaran;
  @override
  State<OverlayForm> createState() {
    return _OverlayState();
  }
}

class _OverlayState extends State<OverlayForm> {
  final namaBarang = TextEditingController();
  final harga = TextEditingController();
  DateTime? setTanggal;
  Category selectedCategory = Category.Food;

  void setCategory(Category category) {
    setState(() {
      selectedCategory = category;
    });
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year - 1, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          TextField(
            controller: namaBarang,
            keyboardType: TextInputType.name,
            cursorColor: const Color(0xFF156A78),
            decoration: InputDecoration(
              labelText: "Nama Pengeluaran",
              labelStyle: GoogleFonts.roboto(
                color: const Color(0xFF156A78),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF156A78),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF156A78)),
              ),
            ),
          ),
          const SizedBox(height: 20), // Add spacing between the text fields
          TextField(
            controller: harga,
            keyboardType: TextInputType.number,
            cursorColor: const Color(0xFF156A78),
            decoration: InputDecoration(
              prefixText: "Rp ",
              labelText: "Harga", // Change this label
              labelStyle: GoogleFonts.roboto(
                color: const Color(0xFF156A78),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF156A78),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF156A78)),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: CustomDropdownButton(
                        selectedCategory: selectedCategory,
                        setCategory: setCategory),
                  ),
                  Text(
                    setTanggal != null
                        ? DateFormat('y/M/dd').format(setTanggal!)
                        : "Select Date",
                    style: GoogleFonts.roboto(
                        color: const Color(0xFF156A78),
                        fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                    onPressed: () async {
                      final selectedDate = await _selectDate(context);
                      if (selectedDate != null) {
                        setState(() {
                          setTanggal = selectedDate;
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.date_range,
                      color: Color(0xFF156A78),
                    ),
                  )
                ],
              ))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                onPressed: () {
                  widget.addPengeluaran(Pengeluaran(
                    namaPengeluaran: namaBarang.text,
                    hargaPengeluaran: double.parse(harga.text),
                    tanggalPengeluaran: setTanggal!,
                    category: selectedCategory,
                  ));
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF156A78),
                    foregroundColor: Colors.white),
                child: const Text("Tambahkan Pengeluaran"),
              )),
            ],
          )
        ],
      ),
    );
  }
}
