import 'package:calculator/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  static const String routeName = 'Calculator_screen';

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String resultText = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      resultText,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(buttonText: 'AC',onBtnClicked: onClearClick),
                CalculatorButton(buttonText:'BS',onBtnClicked: onBackSpaceClick,buttonIcon: Icons.backspace_outlined),
                CalculatorButton(buttonText: '%',onBtnClicked: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(buttonText: '7',onBtnClicked: onDigitClick),
                CalculatorButton(buttonText: '8',onBtnClicked: onDigitClick),
                CalculatorButton(buttonText: '9',onBtnClicked: onDigitClick),
                CalculatorButton(buttonText: '+',onBtnClicked: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(buttonText: '4',onBtnClicked: onDigitClick),
                CalculatorButton(buttonText: '5',onBtnClicked: onDigitClick),
                CalculatorButton(buttonText: '6',onBtnClicked: onDigitClick),
                CalculatorButton(buttonText: '-',onBtnClicked: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(buttonText: '1',onBtnClicked: onDigitClick),
                CalculatorButton(buttonText: '2',onBtnClicked: onDigitClick),
                CalculatorButton(buttonText: '3',onBtnClicked: onDigitClick),
                CalculatorButton(buttonText: '*',onBtnClicked: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(buttonText: '.',onBtnClicked: onDigitClick),
                CalculatorButton(buttonText: '0',onBtnClicked: onDigitClick),
                CalculatorButton(buttonText: '/',onBtnClicked: onOperatorClick),
                CalculatorButton(buttonText: '=',onBtnClicked: onEqualClick),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onDigitClick(String text) {
    resultText += text;
    setState((){});
  }

  void onClearClick(Null){
    resultText = '';
    lhs = '';
    rhs = '';
    operator = '';
    setState((){});

  }

  String lhs ='';
  String rhs ='';
  String operator ='';
  void onOperatorClick(String op){
    if(operator.isEmpty){
      lhs = resultText;
    }else{
      rhs = resultText;
      lhs = calculate(lhs,operator,rhs);
    }
    operator = op;
    resultText = '';
    setState((){});
  }

  void onEqualClick(buttonText){
      rhs = resultText;
      lhs = calculate(lhs, operator, rhs);
      resultText = lhs;
      rhs = '';
      operator = '';
      lhs = resultText;
      setState((){});
  }
  String calculate(String l, String op, String r){
    double num1 = double.parse(l);
    double num2 = double.parse(r);
    double result = 0;
    switch(op){
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = num1 / num2;
        break;
      case '%':
        result = num1 % num2;
        break;
    }
    return result.toString();
  }

  void onBackSpaceClick(buttonText){
    resultText = resultText.substring(0,resultText.length-1);
    setState((){});
  }
}
