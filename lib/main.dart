import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayText = '0';
  double firstNum = 0;
  double secondNum = 0;
  String operation = '';
  bool isSecondNum = false;

  void buttonPressed(String value) {
    setState(() {
      if (value == 'AC') {
        displayText = '0';
        firstNum = 0;
        secondNum = 0;
        operation = '';
        isSecondNum = false;
      } else if (['+', '-', '×', '÷'].contains(value)) {
        firstNum = double.tryParse(displayText) ?? 0;
        operation = value;
        isSecondNum = true;
        displayText = '';
      } else if (value == '=') {
        secondNum = double.tryParse(displayText) ?? 0;
        switch (operation) {
          case '+':
            displayText = (firstNum + secondNum).toString();
            break;
          case '-':
            displayText = (firstNum - secondNum).toString();
            break;
          case '×':
            displayText = (firstNum * secondNum).toString();
            break;
          case '÷':
            displayText = (firstNum / secondNum).toString();
            break;
        }
        isSecondNum = false;
      } else {
        if (displayText == '0' || isSecondNum) {
          displayText = value;
        } else {
          displayText += value;
        }
      }
    });
  }

  Widget buildButton(String text, Color color, Color textColor, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () => buttonPressed(text),
          child: Text(
            text,
            style: TextStyle(fontSize: 28, color: textColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Calculator', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Display screen
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Text(
                displayText,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Buttons
          Expanded(
            flex: 8,
            child: Row(
              children: [
                // Left buttons
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          buildButton('+', Colors.grey[300]!, Colors.black),
                          buildButton('-', Colors.grey[300]!, Colors.black),
                          buildButton('×', Colors.grey[300]!, Colors.black),
                          buildButton('÷', Colors.grey[300]!, Colors.black),
                        ],
                      ),
                      Row(
                        children: [
                          buildButton('7', Colors.white, Colors.black),
                          buildButton('8', Colors.white, Colors.black),
                          buildButton('9', Colors.white, Colors.black),
                        ],
                      ),
                      Row(
                        children: [
                          buildButton('4', Colors.white, Colors.black),
                          buildButton('5', Colors.white, Colors.black),
                          buildButton('6', Colors.white, Colors.black),
                        ],
                      ),
                      Row(
                        children: [
                          buildButton('1', Colors.white, Colors.black),
                          buildButton('2', Colors.white, Colors.black),
                          buildButton('3', Colors.white, Colors.black),
                        ],
                      ),
                      Row(
                        children: [
                          buildButton('0', Colors.white, Colors.black, flex: 2),
                          buildButton('.', Colors.white, Colors.black),
                          buildButton('AC', Colors.red, Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
                // "=" button spanning multiple rows
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Spacer(flex: 1),
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () => buttonPressed('='),
                            child: Text(
                              '=',
                              style: TextStyle(fontSize: 28, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Spacer(flex: 1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
