import 'package:flutter/material.dart';
import 'package:stream_gold_rate/src/features/gold/presentation/gold_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.amberAccent, brightness: Brightness.dark)),
      home: const GoldScreen(),
    );
  }
}
