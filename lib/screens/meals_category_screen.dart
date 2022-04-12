import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsCategoryScreen extends StatelessWidget {
  // const MealsCategoryScreen(
  //     {Key? key, required this.categoryID, required this.categoryTitle})
  //     : super(key: key);
  // final String categoryID;
  // final String categoryTitle;
  static const routeName = "/meals-category";
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs["title"];
    final categoryID = routeArgs["id"];
    final categoryMeals = dummyMeals
        .where((meal) => meal.categories.contains(categoryID))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imgUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability);
        },
      ),
    );
  }
}
