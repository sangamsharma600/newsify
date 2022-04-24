import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsify/contents/termsandconditions.dart';

import '../contents/aboutus.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Terms and Conditions",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 23),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                termsandcondition,
                style: GoogleFonts.poppins(fontSize: 19),
              )
            ],
          ),
        ),
      ),
    );
  }
}
