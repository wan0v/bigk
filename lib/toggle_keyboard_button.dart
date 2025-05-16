import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'keyboard_state.dart';
import 'main.dart';

class ToggleKeyboardButton extends StatelessWidget {
  final String label;
  final double fixedSize;

  const ToggleKeyboardButton({
    super.key,
    required this.label,
    required this.fixedSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fixedSize,
      height: fixedSize,
      child: OutlinedButton(
        onPressed: toggleKeyboardType,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.grey.shade200),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            style: TextStyle(
              fontSize: FONT_SIZE,
              color: Color.fromARGB(255, 110, 110, 110),
            ),
          ),
        ),
      ),
    );
  }
}
