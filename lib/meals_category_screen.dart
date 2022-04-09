import 'package:flutter/material.dart';

class MealsCategoryScreen extends StatelessWidget {
  const MealsCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Category Name"),
        ),
        body: Center(child: Text("Recipies")));
  }
}
