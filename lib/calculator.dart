import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class calculatorApp extends StatefulWidget {
  @override
  State<calculatorApp> createState() => _calculatorAppState();
}

class _calculatorAppState extends State<calculatorApp> {
  var result = '0';
  var output = '';
  var operand = '';
  var num1 = 0;
  var num2 = 0;
  var name = 'qaiser';
  calculation(var title) {
    if (title == 'Clear') {
      result = '';
      operand = '';
      num1 = 0;
      num2 = 0;
      
    
    } else if (title == '/' || title == 'X' || title == '-' || title == '+') {
      num1 = int.parse(output);
      operand = title;
      result = '';
    } else if (title == '=') {
      num2 = int.parse(output);
      if (operand == '/') {
        result = (num1 / num2).toString();
      }
      if (operand == 'X') {
        result = (num1 * num2).toString();
      }
      if (operand == '-') {
        result = (num1 - num2).toString();
      }
      if (operand == '+') {
        result = (num1 + num2).toString();
      }
    } else {
      setState(() {
        result = result + title;
      });
    }
    setState(() {
      output = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                    alignment: Alignment.bottomRight,
                    child: Text('$result',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                height: 2,
                thickness: 2,
                color: Colors.grey,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Box('Clear', Colors.grey.shade800,
                              BoxShape.rectangle),
                          Box('=', Colors.amber.shade800, BoxShape.rectangle),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Box('7', Colors.grey.shade800, BoxShape.circle),
                          Box('8', Colors.grey.shade800, BoxShape.circle),
                          Box('9', Colors.grey.shade800, BoxShape.circle),
                          Box('X', Colors.grey.shade800, BoxShape.circle),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Box('4', Colors.grey.shade800, BoxShape.circle),
                          Box('5', Colors.grey.shade800, BoxShape.circle),
                          Box('6', Colors.grey.shade800, BoxShape.circle),
                          Box('-', Colors.grey.shade800, BoxShape.circle),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Box('1', Colors.grey.shade800, BoxShape.circle),
                          Box('2', Colors.grey.shade800, BoxShape.circle),
                          Box('3', Colors.grey.shade800, BoxShape.circle),
                          Box('/', Colors.grey.shade800, BoxShape.circle),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Box('0', Colors.grey.shade800, BoxShape.circle),
                          Box('00', Colors.grey.shade800, BoxShape.circle),
                          Box('.', Colors.grey.shade800, BoxShape.circle),
                          Box('+', Colors.grey.shade800, BoxShape.circle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Box(var text, Color color, BoxShape s) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: InkWell(
          onTap: () {
            calculation(text);
          },
          child: Container(
            decoration: BoxDecoration(color: color, shape: s),
            child: Center(
                child: Text(text,
                    style: TextStyle(color: Colors.white, fontSize: 30))),
          ),
        ),
      ),
    );
  }
}
