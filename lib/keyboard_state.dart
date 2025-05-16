// In einer neuen Datei: lib/keyboard_state.dart
import 'package:flutter/material.dart';

// Globaler State für den Keyboard-Output
final keyboardOutputNotifier = ValueNotifier<String>("");

// Funktionen zum Manipulieren des Outputs
void addLetter(String letter) {
  keyboardOutputNotifier.value += letter;
}

void removeLastLetter() {
  if (keyboardOutputNotifier.value.isNotEmpty) {
    keyboardOutputNotifier.value = keyboardOutputNotifier.value.substring(
      0,
      keyboardOutputNotifier.value.length - 1,
    );
  }
}

void clearOutput() {
  keyboardOutputNotifier.value = "";
}

// In keyboard_state.dart hinzufügen
enum KeyboardType { alphabet, numeric }

// Füge einen Notifier für den aktuellen Keyboard-Typ hinzu
final keyboardTypeNotifier = ValueNotifier<KeyboardType>(KeyboardType.alphabet);

// Funktion zum Umschalten des Keyboard-Typs
void toggleKeyboardType() {
  if (keyboardTypeNotifier.value == KeyboardType.alphabet) {
    keyboardTypeNotifier.value = KeyboardType.numeric;
  } else {
    keyboardTypeNotifier.value = KeyboardType.alphabet;
  }
}
