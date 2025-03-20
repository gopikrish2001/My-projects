import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  String displayText = '0';
  int? firstOperand;
  String? operator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  displayText,
                  style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ...buildButtonGrid(),
          ],
        ),
      ),
    );
  }

  void onButtonPress(String label) {
    setState(() {
      if (label == 'C') {
        // Reset all values
        displayText = '0';
        firstOperand = null;
        operator = null;
      } else if (label == '+' || label == '-' || label == 'x' || label == '/') {
        // Store the first operand and operator
        firstOperand = int.tryParse(displayText);
        operator = label;
        displayText = '0';
      } else if (label == '=') {
        // Perform calculation based on stored operator
        if (operator != null && firstOperand != null) {
          int secondOperand = int.parse(displayText);
          switch (operator) {
            case '+':
              displayText = (firstOperand! + secondOperand).toString();
              break;
            case '-':
              displayText = (firstOperand! - secondOperand).toString();
              break;
            case 'x':
              displayText = (firstOperand! * secondOperand).toString();
              break;
            case '/':
              if (secondOperand != 0) {
                displayText = (firstOperand! ~/ secondOperand).toString();
              } else {
                displayText = 'Error';
              }
              break;
          }
          operator = null; // Reset operator
        }
      } else {
        // Append digit to display
        displayText = displayText == '0' ? label : displayText + label;
      }
    });
  }

  List<Widget> buildButtonGrid() {
    List<List<String>> buttonLabels = [
      ['7', '8', '9', '+'],
      ['4', '5', '6', '-'],
      ['1', '2', '3', 'x'],
      ['C', '0', '=', '/'],
    ];

    return buttonLabels.map((row) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: row.map((label) => buildButton(label)).toList(),
      );
    }).toList();
  }

  Widget buildButton(String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => onButtonPress(label),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20),
            backgroundColor:
            label == '=' ? Colors.deepPurple : Colors.grey[200],
            foregroundColor: label == '=' ? Colors.white : Colors.black87,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text(label, style: const TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}





































      




