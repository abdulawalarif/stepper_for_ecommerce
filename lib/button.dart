import 'package:flutter/material.dart';

class Button extends StatelessWidget {
   final VoidCallback onPressed;  
  final String text;
  const Button({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      child: Text(text),  
    );
  }
}