import 'package:flutter/material.dart';
import 'package:mealmate/models/meal.dart';
import 'package:mealmate/widgets/meal_item.dart';

import 'meal_details.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meal,
    required this.toggleFavouriteMeal,
  });

  final String? title;
  final List<Meal> meal;
  final void Function(Meal meal) toggleFavouriteMeal;
  void _selectedMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            MealDetails(meal: meal, toggleFavouriteMeal: toggleFavouriteMeal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Uooh ... Category is empty',
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: Colors.red),
          ),
          Text(
            'Try another one ...',
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: Colors.red),
          ),
        ],
      ),
    );
    if (meal.isNotEmpty) {
      content = ListView.builder(
        itemCount: meal.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meal[index],
          onSelectMeal: (meal) {
            _selectedMeal(context, meal);
          },
        ),
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!, style: TextStyle(fontWeight: FontWeight.w800)),
        centerTitle: true,
      ),
      body: content,
    );
  }
}
