import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = '0';

  void onButtonPressed(String value) {
    setState(() {
      if (value == 'AC') {
        display = '0';
      } else if (value == '=') {
        try {
          Parser parser = Parser();
          Expression expression = parser.parse(display.replaceAll('x', '*').replaceAll('÷', '/'));
          ContextModel contextModel = ContextModel();
          double result = expression.evaluate(EvaluationType.REAL, contextModel);
          display = result.toString();
        } catch (e) {
          display = 'Error';
        }
      } else {
        if (display == '0' || display == 'Error') {
          display = value;
        } else {
          display += value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                display,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: ['+', '-', 'x', '÷'].map((text) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () => onButtonPressed(text),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        text,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: ['7', '8', '9'].map((text) {
                            return Expanded(
                              child: GestureDetector(
                                onTap: () => onButtonPressed(text),
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    text,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: ['4', '5', '6'].map((text) {
                            return Expanded(
                              child: GestureDetector(
                                onTap: () => onButtonPressed(text),
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    text,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: ['1', '2', '3'].map((text) {
                            return Expanded(
                              child: GestureDetector(
                                onTap: () => onButtonPressed(text),
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    text,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: ['0', '.', 'AC'].map((text) {
                            return Expanded(
                              child: GestureDetector(
                                onTap: () => onButtonPressed(text),
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: text == 'AC' ? Colors.red : Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    text,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: text == 'AC' ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 0,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 4,
                        child: GestureDetector(
                          onTap: () => onButtonPressed('='),
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              '=',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
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
