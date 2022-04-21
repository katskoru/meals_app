import 'package:flutter/material.dart';

import '../models/meal.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key, required this.favMeals}) : super(key: key);
  final List<Meal> favMeals;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Favs"),
    );
  }
}
