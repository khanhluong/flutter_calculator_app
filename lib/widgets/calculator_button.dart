import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String buttonLabel;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

  const CalculatorButton(
      {this.buttonLabel,
      this.fillColor,
      this.textColor,
      this.textSize,
      this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.19,
        height: MediaQuery.of(context).size.width * 0.19,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Text(
            buttonLabel,
            style: GoogleFonts.aBeeZee(fontSize: textSize),
          ),
          onPressed: () => callback(buttonLabel),
          color: Color(fillColor),
          textColor: Color(textColor),
        ),
      ),
    );
  }
}
