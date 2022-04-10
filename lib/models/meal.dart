enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  final List<String> categoryIds;
  final String name;
  final String imgUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegeterian;

  Meal(
      {required this.id,
      required this.categoryIds,
      required this.name,
      required this.imgUrl,
      required this.ingredients,
      required this.steps,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.isGlutenFree,
      required this.isLactoseFree,
      required this.isVegan,
      required this.isVegeterian});
}
