import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/meals_category_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };
  List<Meal> _availableMeals = dummyMeals;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = dummyMeals.where((meal) {
        if (_filters["gluten"] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters["vegan"] == true && !meal.isVegan) {
          return false;
        }
        if (_filters["vegetarian"] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
      initialRoute: "/",
      routes: {
        "/": (ctx) => TabsScreen(),
        MealsCategoryScreen.routeName: (ctx) =>
            MealsCategoryScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              saveFilters: _setFilters,
              currentFilters: _filters,
            )
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
