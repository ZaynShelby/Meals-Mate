import 'package:flutter/material.dart';
import 'package:mealmate/models/meal.dart';
import 'package:mealmate/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meal});

  final String title;
  final List<Meal> meal;

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
        itemBuilder: (ctx, index) => MealItem(meal: meal[index]),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: content,
    );
  }
}
