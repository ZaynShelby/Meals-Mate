import 'package:flutter/material.dart';
import 'package:mealmate/data/dummy_data.dart';
import 'package:mealmate/models/category.dart';
import 'package:mealmate/screens/meals.dart';
import 'package:mealmate/widgets/category_grid_item.dart';

import '../models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.toggleFavouriteMeal,
    required this.availableMeals,
  });

  final void Function(Meal meal) toggleFavouriteMeal;
  final List<Meal> availableMeals;

  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeal = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meal: filteredMeal,
          toggleFavouriteMeal: toggleFavouriteMeal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 3 / 2,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectedCategory(context, category);
            },
          ),
      ],
    );
  }
}
