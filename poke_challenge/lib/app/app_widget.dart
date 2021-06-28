import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'POKE CHALLENGE',
        theme: ThemeData(
          textTheme: GoogleFonts.encodeSansTextTheme(
            Theme.of(context).textTheme,
          ),
        )).modular();
  }
}
