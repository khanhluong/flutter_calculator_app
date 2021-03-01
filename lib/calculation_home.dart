import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/const.dart';
import 'package:flutter_calculator_app/themes/custom_themes.dart';
import 'package:flutter_calculator_app/widgets/calculator_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sprintf/sprintf.dart';

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  int firstNumber;
  int secondNumber;
  String history = '';
  String resultToDisplay = '';
  String result;
  String operation = '';

  String formatHistory(int firstNumber, int secondNumber, String operation) {
    String result =
        sprintf('%s %s %s %s', [firstNumber, operation, secondNumber, '=']);
    return result;
  }

  void btnOnClick(String btnValue) {
    if (btnValue == 'C') {
      resultToDisplay = '';
      firstNumber = 0;
      secondNumber = 0;
      result = '';
      operation = '';
    } else if (btnValue == 'AC') {
      resultToDisplay = '';
      firstNumber = 0;
      secondNumber = 0;
      result = '';
      history = '';
      operation = '';
    } else if (btnValue == '+/-') {
      if (resultToDisplay[0] != '-') {
        result = '-' + resultToDisplay;
      } else {
        result = resultToDisplay.substring(1);
      }
    } else if (btnValue == '<') {
      result = resultToDisplay.substring(0, resultToDisplay.length - 1);
    } else if (btnValue == '+' ||
        btnValue == '-' ||
        btnValue == 'X' ||
        btnValue == '/') {
      firstNumber = int.parse(resultToDisplay);
      result = '';
      operation = btnValue;
    } else if (btnValue == "=") {
      secondNumber = int.parse(resultToDisplay);
      if (operation == '+') {
        result = (firstNumber + secondNumber).toString();
        history = formatHistory(firstNumber, secondNumber, operation);
      }

      if (operation == '-') {
        result = (firstNumber - secondNumber).toString();
        history = formatHistory(firstNumber, secondNumber, operation);
      }

      if (operation == 'X') {
        result = (firstNumber * secondNumber).toString();
        history = formatHistory(firstNumber, secondNumber, operation);
      }
      if (operation == '/') {
        result = (firstNumber / secondNumber).toString();
        history = formatHistory(firstNumber, secondNumber, operation);
      }
      //reset operation
      // operation = '=';
      // firstNumber = 0;
      // secondNumber = 0;
    } else {
      //add number
      if (operation.isNotEmpty) {
        resultToDisplay = '';
      }
      result = int.parse(resultToDisplay + btnValue).toString();
    }

    setState(() {
      //update result
      resultToDisplay = result;
      // result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Calculator'),
        ),
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  history,
                  style: GoogleFonts.rubik(
                      textStyle:
                          TextStyle(fontSize: 24, color: Color(0xFF260801))),
                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  resultToDisplay,
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(fontSize: 48, color: Colors.black)),
                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  buttonLabel: 'AC',
                  fillColor: Constants.btnColor01,
                  textColor: Constants.txtColor,
                  textSize: Constants.txtSize,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  buttonLabel: 'C',
                  fillColor: Constants.btnColor01,
                  textColor: Constants.txtColor,
                  textSize: Constants.txtSize,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  buttonLabel: '<',
                  fillColor: Constants.btnColor02,
                  textColor: Constants.txtColor,
                  textSize: Constants.txtSize,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  buttonLabel: '/',
                  fillColor: Constants.btnColor02,
                  textColor: Constants.txtColor,
                  textSize: Constants.txtSize,
                  callback: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  buttonLabel: '9',
                  fillColor: Constants.btnColor01,
                  textColor: Constants.txtColor,
                  textSize: Constants.txtSize,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  buttonLabel: '8',
                  fillColor: Constants.btnColor01,
                  textColor: Constants.txtColor,
                  textSize: Constants.txtSize,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  buttonLabel: '7',
                  fillColor: Constants.btnColor01,
                  textColor: Constants.txtColor,
                  textSize: Constants.txtSize,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  buttonLabel: 'X',
                  fillColor: Constants.btnColor02,
                  textColor: Constants.txtColor,
                  textSize: Constants.txtSize,
                  callback: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  buttonLabel: '6',
                  fillColor: Constants.btnColor01,
                  textColor: Constants.txtColor,
                  textSize: Constants.txtSize,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  buttonLabel: '5',
                  fillColor: Constants.btnColor01,
                  textColor: Constants.txtColor,
                  textSize: Constants.txtSize,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  buttonLabel: '4',
                  fillColor: Constants.btnColor01,
                  textColor: Constants.txtColor,
                  textSize: Constants.txtSize,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  buttonLabel: '-',
                  fillColor: Constants.btnColor02,
                  textColor: Constants.txtColor,
                  textSize: Constants.txtSize,
                  callback: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  buttonLabel: '3',
                  fillColor: Constants.btnColor01,
                  textColor: Constants.txtColor,
                  textSize: Constants.txtSize,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  buttonLabel: '2',
                  fillColor: Constants.btnColor01,
                  textColor: Constants.txtColor,
                  textSize: Constants.txtSize,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  buttonLabel: '1',
                  fillColor: Constants.btnColor01,
                  textColor: Constants.txtColor,
                  textSize: Constants.txtSize,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  buttonLabel: '+',
                  fillColor: Constants.btnColor02,
                  textColor: Constants.txtColor,
                  textSize: Constants.txtSize,
                  callback: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  buttonLabel: '+/-',
                  fillColor: Constants.btnColor01,
                  textColor: Constants.txtColor,
                  textSize: Constants.txtSize,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  buttonLabel: '0',
                  fillColor: Constants.btnColor01,
                  textColor: Constants.txtColor,
                  textSize: Constants.txtSize,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  buttonLabel: '00',
                  fillColor: Constants.btnColor01,
                  textColor: Constants.txtColor,
                  textSize: Constants.txtSize,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  buttonLabel: '=',
                  fillColor: Constants.btnColor02,
                  textColor: Constants.txtColor,
                  textSize: Constants.txtSize,
                  callback: btnOnClick,
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
