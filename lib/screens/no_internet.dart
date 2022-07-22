import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Please check your internet connection and try again.",
            style: GoogleFonts.poppins(
              fontSize: 26,
              color: Colors.lightBlueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
