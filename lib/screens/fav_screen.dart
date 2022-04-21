import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key, required this.favMeals}) : super(key: key);
  final List<Meal> favMeals;
  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return Container(
        child: Text("Favs"),
      );
    } else {
      return ListView.builder(
        itemCount: favMeals.length,
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            id: favMeals[index].id,
            title: favMeals[index].title,
            imageUrl: favMeals[index].imgUrl,
            duration: favMeals[index].duration,
            complexity: favMeals[index].complexity,
            affordability: favMeals[index].affordability,
          );
        },
      );
    }
  }
}
