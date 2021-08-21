import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning', style: GoogleFonts.kanit(color: Colors.red)),
      content: Text(
        'ต้องการลบรายการสินค้า ออกจากตระกร้า?',
        style: GoogleFonts.kanit(),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Yes', style: GoogleFonts.kanit(color: Colors.green)),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        FlatButton(
          child: Text(
            'No',
            style: GoogleFonts.kanit(color: Colors.red),
          ),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}
