import 'package:flutter/material.dart';
import 'package:meals_app/meals_category_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  const CategoryItem({Key? key, required this.title, required this.color})
      : super(key: key);

  selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return MealsCategoryScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        selectCategory(context);
      },
      child: Container(
        height: 40,
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 5),
              )
            ],
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [color.withOpacity(0.5), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
      ),
    );
  }
}
