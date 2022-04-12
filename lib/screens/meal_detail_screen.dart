import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);
  static const routeName = "/meal-detail";
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text("${selectedMeal.title}"),
        ),
        body: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text("Ingredients"),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.amber,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                  color: Theme.of(context).cardColor,
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
              height: 200,
              width: 300,
            )
          ],
        ));
  }
}
