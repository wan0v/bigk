import 'package:bigK/keyboard_button.dart';
import 'package:bigK/keyboard_state.dart';
import 'package:bigK/main.dart';
import 'package:bigK/toggle_keyboard_button.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({super.key});

  static const alphabet = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
    "Ä",
    "Ö",
    "Ü",
    "ß",
    "123",
  ];

  static const numbers = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0",
    "ABC",
  ];

  // Konstante für die Anzahl der Spalten
  static const int alphabetColumns = 8;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<KeyboardType>(
      valueListenable: keyboardTypeNotifier,
      builder: (context, keyboardType, child) {
        final items =
            keyboardType == KeyboardType.alphabet ? alphabet : numbers;

        // Wir verwenden immer das Alphabet-Layout als Basis für die Buttongröße
        final screenWidth =
            MediaQuery.of(context).size.width - 16; // Abzüglich des Paddings
        final spacing = 20.0;

        // Berechnung der Buttonbreite basierend auf dem Alphabet-Layout
        final buttonSize =
            (screenWidth - (alphabetColumns - 1) * spacing) / alphabetColumns;

        // Für das Zahlenlayout berechnen wir, wie viele Buttons in eine Zeile passen
        final numberColumns = 5;

        if (keyboardType == KeyboardType.alphabet) {
          // Alphabet-Layout mit GridView
          return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: alphabetColumns,
              mainAxisSpacing: spacing,
              crossAxisSpacing: spacing,
              childAspectRatio: 1.0,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return index == items.length - 1
                  ? ToggleKeyboardButton(label: "123", fixedSize: buttonSize)
                  : KeyboardButton(letter: items[index], fixedSize: buttonSize);
            },
          );
        } else {
          // Zahlen-Layout mit manueller Anordnung
          // Berechnen, wie viele Zeilen wir brauchen
          final rows = (items.length / numberColumns).ceil();

          return Column(
            children: List.generate(rows, (rowIndex) {
              final startIndex = rowIndex * numberColumns;
              final endIndex =
                  (startIndex + numberColumns) > items.length
                      ? items.length
                      : startIndex + numberColumns;

              // Berechnen des horizontalen Abstands für diese Zeile
              final buttonsInRow = endIndex - startIndex;
              final rowWidth =
                  buttonsInRow * buttonSize + (buttonsInRow - 1) * spacing;
              final horizontalPadding = (screenWidth - rowWidth) / 2;

              return Padding(
                padding: EdgeInsets.only(
                  left: horizontalPadding,
                  right: horizontalPadding,
                  bottom: spacing,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(buttonsInRow, (i) {
                    final index = startIndex + i;
                    return Padding(
                      padding: EdgeInsets.only(
                        right: i < buttonsInRow - 1 ? spacing : 0,
                      ),
                      child:
                          index == items.length - 1
                              ? ToggleKeyboardButton(
                                label: "ABC",
                                fixedSize: buttonSize,
                              )
                              : KeyboardButton(
                                letter: items[index],
                                fixedSize: buttonSize,
                              ),
                    );
                  }),
                ),
              );
            }),
          );
        }
      },
    );
  }
}
