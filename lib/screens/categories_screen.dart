import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      children: dummyCategories
          .map((catData) => CategoryItem(
                title: catData.title,
                color: catData.color,
                id: catData.id,
              ))
          .toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
