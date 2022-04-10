import 'package:flutter/material.dart';
import 'package:meals_app/categories_screen.dart';
import 'package:meals_app/meals_category_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          canvasColor: Colors.white,
          fontFamily: "Kalam",
          colorScheme: const ColorScheme(
              error: Colors.red,
              onError: Colors.black,
              brightness: Brightness.light,
              background: Colors.purple,
              onBackground: Colors.lightBlue,
              primary: Color.fromARGB(255, 101, 85, 99),
              onPrimary: Colors.black,
              onSecondary: Colors.green,
              secondary: Colors.cyanAccent,
              surface: Colors.pink,
              onSurface: Colors.amber)),
      home: CategoriesScreen(),
      routes: {"/meals-category": (ctx) => MealsCategoryScreen()},
    );
  }
}
