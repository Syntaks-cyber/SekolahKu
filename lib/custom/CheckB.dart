import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget{
  final bool value;
  final String text;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final String label;

  const CustomCheckBox(
      {Key key,
        this.value,
        this.text,
        this.onChanged,
        this.activeColor,
        this.label}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Checkbox(
            value: value,
            onChanged: (value){
              onChanged(value);
            },
            activeColor: activeColor),
        Text(text),
      ],
    );
  }
}