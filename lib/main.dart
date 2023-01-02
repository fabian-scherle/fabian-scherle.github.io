import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/app.dart';
import 'package:portfolio/src/bootstrap.dart';

Future<void> main() async {
  runApp(UncontrolledProviderScope(
      container: await bootstrap(), child: const PortafolioApp()));
}
