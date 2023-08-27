import 'package:flutter/material.dart';
import 'package:pencatat_pengeluaran/main_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: const MainScreen(),
      theme: ThemeData().copyWith(useMaterial3: true),
    ),
  );
}
