import 'dart:async';
    
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Future<void> main() async {
  final done = Completer<void>();
  runApp(BigRedOne(done: done));
  // other async stuff goes here
  await done.future;
  runApp(
    const MyApp(),
  );
}

class BigRedOne extends StatelessWidget {
  const BigRedOne({
    required this.done,
    super.key,
  });
  final Completer<void> done;

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: SizedBox.expand(
          child: ColoredBox(
            color: Colors.red,
            child: FittedBox(
              child: const Text('1')
                  .animate(onComplete: (_) => done.complete())
                  .fadeIn(duration: 2000.ms)
                  .then()
                  .fadeOut(),
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Text('Hello World'),
      ),
    );
  }
}