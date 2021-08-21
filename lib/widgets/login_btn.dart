import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

MaterialButton longButtons(String title, Function fun,
    {color: const Color(0xFF2E7D32), Color textColor: Colors.white}) {
  return MaterialButton(
    onPressed: fun,
    textColor: textColor,
    color: color,
    child: SizedBox(
      width: double.infinity,
      child: Text(
        title,
        style: GoogleFonts.kanit(),
        textAlign: TextAlign.center,
      ),
    ),
    height: 45,
    minWidth: 600,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))),
  );
}

label(String title) => Text(
      title,
      style: GoogleFonts.kanit(),
    );

InputDecoration buildInputDecoration(String  , IconData icon) {
  return InputDecoration(
    prefixIcon: Icon(icon, color: HexColor('#36803a')),
    // hintText: hintText,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
  );
}
