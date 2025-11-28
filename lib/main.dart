import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'router.dart';

void main() {
  runApp(ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Broto',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.white)),
      routerConfig: goRouter,
    );
  }
}
