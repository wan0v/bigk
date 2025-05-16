import 'package:bigK/keyboard_state.dart';
import 'package:bigK/main.dart';
import 'package:flutter/material.dart';

class KeyboardButton extends StatelessWidget {
  final String letter;
  final double fixedSize;

  const KeyboardButton({
    super.key,
    required this.letter,
    required this.fixedSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fixedSize,
      height: fixedSize,
      child: OutlinedButton(
        onPressed: () {
          addLetter(letter);
        },
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            letter,
            style: TextStyle(fontSize: FONT_SIZE, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
