import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/fav_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key, required this.favMeals}) : super(key: key);

  final List<Meal> favMeals;
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>>? _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {"page": const CategoriesScreen(), "title": "Categories"},
      {"page": FavScreen(favMeals: widget.favMeals), "title": "Favourites"},
    ];
    super.initState();
  }

  _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages![_selectedPageIndex]["title"].toString()),
      ),
      drawer: const MainDrawer(),
      body: _pages![_selectedPageIndex]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.amber,
          onTap: _selectPage,
          unselectedItemColor: const Color.fromARGB(255, 101, 85, 99),
          selectedItemColor: Colors.red[800],
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                ),
                label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: "Favourites"),
          ]),
    );
  }
}
