///main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/src/app.dart';

void main() {
  runApp(
    ProviderScope(
      child: RiverpodJokesApp(),
    ),
  );
}
