import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:indojek/ui/screens/beranda.dart';

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
    Key? key,
    required this.done,
  }) : super(key: key);
  final Completer<void> done;

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: SizedBox.expand(
              child: RiveAnimation.asset('assets/1467-2856-delivery-bike.riv')
                  .animate(onComplete: (_) => done.complete())
                  .fadeIn(duration: 2000.ms)
                  .then()
                  .fadeOut(),
          ),
        ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IndoJek',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Beranda(),
    );
  }
}
