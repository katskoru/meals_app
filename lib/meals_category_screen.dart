import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealsCategoryScreen extends StatelessWidget {
  // const MealsCategoryScreen(
  //     {Key? key, required this.categoryID, required this.categoryTitle})
  //     : super(key: key);
  // final String categoryID;
  // final String categoryTitle;

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
          return Text(categoryMeals[index].title);
        },
      ),
    );
  }
}
