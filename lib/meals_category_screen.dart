import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Text("data");
        },
      ),
    );
  }
}
