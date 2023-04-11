import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget{
  String buttonText;
  Function onBtnClicked;
  final IconData? buttonIcon;
  CalculatorButton({required this.buttonText,required this.onBtnClicked,this.buttonIcon});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
        child: Container(
          margin: EdgeInsets.all(1),
          child: ElevatedButton(

              onPressed: () {
                onBtnClicked(buttonText);
              },
            child: buttonIcon != null // check if icon is provided
                ? Icon(
              buttonIcon,
              size: 32,
            )
                : Text(
              buttonText,
              style: TextStyle(fontSize: 24),
            ),
          ),
        ));

  }

}