import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsCategoryScreen extends StatefulWidget {
  static const routeName = "/meals-category";
  final List<Meal> availableMeals;

  const MealsCategoryScreen({Key? key, required this.availableMeals})
      : super(key: key);

  @override
  State<MealsCategoryScreen> createState() => _MealsCategoryScreenState();
}

class _MealsCategoryScreenState extends State<MealsCategoryScreen> {
  List? categoryTitle = [];
  List<Meal>? displayedMeals = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitleF = routeArgs["title"];
    final categoryID = routeArgs["id"];
    final displayedMealsF = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryID))
        .toList();

    displayedMeals!.addAll(displayedMealsF);
    categoryTitle!.add(categoryTitleF);
  }

  _removeMeal(String mealId) {
    setState(() {
      displayedMeals!.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle![0]),
      ),
      body: Container(
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
          itemCount: displayedMeals!.length,
          itemBuilder: (BuildContext context, int index) {
            return MealItem(
              id: displayedMeals![index].id,
              title: displayedMeals![index].title,
              imageUrl: displayedMeals![index].imgUrl,
              duration: displayedMeals![index].duration,
              complexity: displayedMeals![index].complexity,
              affordability: displayedMeals![index].affordability,
            );
          },
        ),
      ),
    );
  }
}
