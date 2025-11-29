import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'router.dart';

// A basic logger, which logs any state changes.
final class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    print('''
{
  "provider": "${context.provider}",
  "newValue": "$newValue",
  "mutation": "${context.mutation}"
}''');
  }
}

void main() {
  runApp(ProviderScope(observers: [Logger()], child: App()));
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
