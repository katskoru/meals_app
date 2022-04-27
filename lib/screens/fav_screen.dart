import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key, required this.favMeals}) : super(key: key);
  final List<Meal> favMeals;
  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return const Center(
        child: Text("Select your favourite meal"),
      );
    } else {
      return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: 70,
              image: NetworkImage(
                  "https://images.pexels.com/photos/262896/pexels-photo-262896.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
              fit: BoxFit.cover),
        ),
        child: ListView.builder(
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
        ),
      );
    }
  }
}
