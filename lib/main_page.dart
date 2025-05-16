import 'package:bigK/keyboard.dart';
import 'package:bigK/keyboard_output.dart';
import 'package:bigK/main.dart';
import 'package:flutter/material.dart';

import 'keyboard_state.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              clearOutput(); // Löscht den gesamten Output
            },
            child: Text("Neu"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                KeyboardOutput(),
                // In MainPage, aktualisieren Sie den IconButton für Backspace
                IconButton(
                  iconSize: FONT_SIZE - 40,
                  onPressed: () {
                    removeLastLetter(); // Entfernt den letzten Buchstaben
                  },
                  icon: Icon(Icons.backspace_outlined),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(child: Keyboard()),
          ],
        ),
      ),
    );
  }
}
