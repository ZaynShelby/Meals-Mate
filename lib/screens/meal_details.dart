import 'package:flutter/material.dart';
import 'package:mealmate/models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.star_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(image: NetworkImage(meal.imageUrl)),
            SizedBox(height: 10),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            for (final ingredient in meal.ingredients)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  textAlign: TextAlign.center,
                  ingredient,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            SizedBox(height: 20),
            Text(
              softWrap: true,
              textAlign: TextAlign.center,
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            for (final steps in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  steps,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
