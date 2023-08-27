// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pencatat_pengeluaran/data/pengeluaran.dart';
import 'package:pencatat_pengeluaran/login.dart';
import 'package:pencatat_pengeluaran/home.dart';
import 'package:pencatat_pengeluaran/data/account.dart';
import 'package:pencatat_pengeluaran/components/OverlayForm.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() {
    return _MainScreens();
  }
}

class _MainScreens extends State<MainScreen> {
  void _ValidationLogin(String username, String password) {
    if (accountList.any((account) =>
        account.username == username && account.password == password)) {
      setState(() {
        activeScreen = HomeScreen(
          LogoutScreen: logOut,
          pengeluaran: listPengeluaran,
        );
      });
    }
  }

  Widget? activeScreen;
  @override
  void initState() {
    activeScreen = HomeScreen(
      LogoutScreen: logOut,
      pengeluaran: listPengeluaran,
    );
    super.initState();
  }

  void logOut() {
    setState(() {
      activeScreen = LoginScreen(cekUser: _ValidationLogin);
    });
  }

  void addPengeluaran(Pengeluaran pengeluaran) {
    setState(() {
      listPengeluaran.add(pengeluaran);
      activeScreen = HomeScreen(
        LogoutScreen: logOut,
        pengeluaran: listPengeluaran,
      );
    });
  }

  void ShowOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (context) => OverlayForm(
              addPengeluaran: addPengeluaran,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: activeScreen is HomeScreen
          ? AppBar(
              title: Text(
                "Money Checker",
                style: GoogleFonts.roboto(),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      ShowOverlay();
                    },
                  ),
                )
              ],
              backgroundColor: const Color(0xFF156A78),
              foregroundColor: Colors.white,
              elevation: 5,
              shadowColor: Colors.black,
            )
          : null,
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF156A78), Color(0xFF4DAE7A)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: activeScreen),
    );
  }
}
