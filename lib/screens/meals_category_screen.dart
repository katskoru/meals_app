import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsCategoryScreen extends StatefulWidget {
  // const MealsCategoryScreen(
  //     {Key? key, required this.categoryID, required this.categoryTitle})
  //     : super(key: key);
  // final String categoryID;
  // final String categoryTitle;
  static const routeName = "/meals-category";

  @override
  State<MealsCategoryScreen> createState() => _MealsCategoryScreenState();
}

class _MealsCategoryScreenState extends State<MealsCategoryScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (_loadedInitData == false) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryTitle = routeArgs["title"];
      final categoryID = routeArgs["id"];
      final displayedMeals = dummyMeals
          .where((meal) => meal.categories.contains(categoryID))
          .toList();
      _loadedInitData = true;
    }

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals!.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemCount: displayedMeals!.length,
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            id: displayedMeals![index].id,
            title: displayedMeals![index].title,
            imageUrl: displayedMeals![index].imgUrl,
            duration: displayedMeals![index].duration,
            complexity: displayedMeals![index].complexity,
            affordability: displayedMeals![index].affordability,
            removeItem: _removeMeal,
          );
        },
      ),
    );
  }
}
