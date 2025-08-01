enum Affordability { affordable, medium, pricey }

enum Complexity { easy, moderate, complex }

class Meal {
  const Meal({
    required this.id,
    required this.title,
    required this.categories,
    required this.imageUrl,
    required this.duration,
    required this.affordability,
    required this.complexity,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.vegan,
    required this.vegetarian,
  });
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final String duration;
  final Affordability affordability;
  final Complexity complexity;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool vegan;
  final bool vegetarian;
}
