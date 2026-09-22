import 'package:flutter/material.dart';
import 'coffe_shop.dart';

void main() {
  runApp(const ZecoffeApp());
}

class ZecoffeApp extends StatefulWidget {
  const ZecoffeApp({super.key});

  @override
  State<ZecoffeApp> createState() => _ZecoffeAppState();
}

class _ZecoffeAppState extends State<ZecoffeApp> {
  ThemeMode themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      themeMode = themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Warna utama Zecoffe
    const seedColor = Color.fromARGB(255, 128, 92, 64);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zecoffe',
      themeMode: themeMode,

      // Light Theme
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
      ),

      // Dark Theme
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
      ),

      home: CoffeeShopScreen(
        onToggleTheme: toggleTheme,
      ),
    );
  }
}