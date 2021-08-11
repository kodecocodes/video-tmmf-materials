import 'package:flutter/material.dart';

import 'pages/main_page.dart';

void main() => runApp(const MyApp());

final lightTheme = ThemeData(
  primaryColor: Colors.red,
  accentColor: Colors.green,
  fontFamily: 'Lato',
  textTheme: const TextTheme(
    headline5: TextStyle(fontSize: 24),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Widget',
      theme: lightTheme,
      darkTheme: ThemeData.dark(),
      // themeMode: ThemeMode.dark,
      home: const MainPage(),
    );
  }
}
