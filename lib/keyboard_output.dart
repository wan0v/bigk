import 'package:bigK/keyboard_state.dart';
import 'package:bigK/main.dart';
import 'package:flutter/material.dart';

class KeyboardOutput extends StatelessWidget {
  const KeyboardOutput({super.key});

  // Feste Höhe für den Output-Bereich
  static const double outputHeight = 130.0;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: keyboardOutputNotifier,
      builder: (context, value, child) {
        return Expanded(
          child: Container(
            height: outputHeight,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Berechne die Textgröße basierend auf der Länge
                final textLength = value.length;
                double fontSize = FONT_SIZE;

                // Reduziere die Schriftgröße, wenn der Text zu lang wird
                if (textLength > 15) {
                  fontSize = FONT_SIZE * 0.8;
                }
                if (textLength > 25) {
                  fontSize = FONT_SIZE * 0.6;
                }
                if (textLength > 40) {
                  fontSize = FONT_SIZE * 0.5;
                }

                return Text(
                  value,
                  style: TextStyle(fontSize: fontSize),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
